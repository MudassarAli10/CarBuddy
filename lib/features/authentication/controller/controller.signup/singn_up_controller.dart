import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/data/repository/user/user_repository.dart';
import 'package:ecomerence_app/features/authentication/screens/sign_up_Screen/verify_email.dart';
import 'package:ecomerence_app/features/personalization/model/user_model.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/popups/full_screen_loader.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Variables
  final hidePaswword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SignUp
  Future<void> signup() async {
    try {
      // Loading
      TFullScreenLoader.openLoadingDialogue(
          'We are processing Your Information.....', TImages.docerAnimation);
      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Check privacy policy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, You must accept our privacy policy');
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the firebase Authentication, Save User data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save User data in Firestore with approval status
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
          approved: false); // Set approved to false by default

      final userRepository = Get.put(UserRepository());
      await userRepository.savedUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created. Verify email to continue.');

      // Move to VerifyEmailScreen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  googleSignIn() {}
}
