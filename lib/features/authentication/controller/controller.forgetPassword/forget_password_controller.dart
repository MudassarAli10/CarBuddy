import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/features/authentication/screens/password_configration/reset_password.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/popups/full_screen_loader.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  //Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'Processing Your Request .....', TImages.docerAnimation);
      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent', message: 'Eamil Link Sent To Reset Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialogue(
          'Processing Your Request .....', TImages.docerAnimation);

      //Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Success Screen
      TLoaders.successSnackBar(
          title: 'Email Sent', message: 'Eamil Link Sent To Reset Password'.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }
}
