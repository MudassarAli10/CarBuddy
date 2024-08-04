import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/data/repository/user/user_repository.dart';
import 'package:ecomerence_app/features/authentication/screens/loginScreen/login.dart';
import 'package:ecomerence_app/features/personalization/model/user_model.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/widget/re_authenticate_user.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/popups/full_screen_loader.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final imageUploading = false.obs;
  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  Rx<UserModel> user = UserModel.empty().obs;
  final UserRepository userRepository = UserRepository();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save User Info from any Registration
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isNotEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          //Map Data
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');
          //Save User Data
          await userRepository.savedUserRecord(user);
          //Remove Loading
          TFullScreenLoader.stopLoading();
          //Redirect
          AuthenticationRepository.instance.screenRedirect();
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Gets Not Server',
          message:
              'Something went wrong while saving your information. You can re-save your information.');
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want delete youe acount permanently? This action is not reversible',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  ///Delete Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          'Processing', TImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signinWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  ///RE-Authenticate Account
  Future<void> reAuthWithEmailAndPassword() async {
    try {
      // Loading
      TFullScreenLoader.openLoadingDialogue(
          'Processing', TImages.docerAnimation);
      //Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Register user in the firebase Authentication ,Save User data
      await AuthenticationRepository.instance.reAuthWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  ///Upload PProfile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('User/Image/Profile', image);
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulation',
            message: 'Your Profile Is Updated Successfully');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'OH Snap', message: 'Something Went Wrong');
    } finally {
      imageUploading.value = false;
    }
  }
}
