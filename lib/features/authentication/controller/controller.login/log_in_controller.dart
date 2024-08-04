import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/popups/full_screen_loader.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Initialize fields from local storage if Remember Me was checked
    email.text = localStorage.read('Remember-Me-Email') ?? '';
    password.text = localStorage.read('Remember-Me-Password') ?? '';
  }

  // Email & Password Sign-in
  Future<void> emailAndPasswordSignin() async {
    try {
      // Loading
      TFullScreenLoader.openLoadingDialogue(
          'We are processing Your Information.....', TImages.docerAnimation);

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save User Info if REMEMBER ME is selected
      if (rememberMe.value) {
        localStorage.write('Remember-Me-Email', email.text.trim());
        localStorage.write('Remember-Me-Password', password.text.trim());
      }

      // Login user using Email & Password
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Check if the user is approved
      if (userCredential != null && userCredential.user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        // Stop loading
        TFullScreenLoader.stopLoading();

        if (userDoc.exists && userDoc['approved'] == true) {
          // Redirect to main screen if approved
          AuthenticationRepository.instance.screenRedirect();
        } else {
          // Show an error message if not approved
          TLoaders.errorSnackBar(
            title: 'Account Not Approved',
            message: 'Your account is pending approval by the admin.',
          );
        }
      } else {
        // Stop loading and show error message
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Login Failed',
          message: 'Failed to login. Please try again.',
        );
      }
    } catch (e) {
      // Stop loading and show error message
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  // Using Google to sign-in
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'Logging in ...', TImages.docerAnimation);

      // Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signinWithGoogle();

      // Check if the user is approved
      if (userCredential != null && userCredential.user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        // Stop Loading
        TFullScreenLoader.stopLoading();

        if (userDoc.exists && userDoc['approved'] == true) {
          // Redirect to main screen if approved
          AuthenticationRepository.instance.screenRedirect();
        } else {
          // Show an error message if not approved
          TLoaders.errorSnackBar(
            title: 'Account Not Approved',
            message: 'Your account is pending approval by the admin.',
          );
        }
      } else {
        // Stop loading and show error message
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Login Failed',
          message: 'Failed to login. Please try again.',
        );
      }
    } catch (e) {
      // Handle errors
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }
}
