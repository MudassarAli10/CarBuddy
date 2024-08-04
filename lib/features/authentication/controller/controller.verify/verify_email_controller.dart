import 'dart:async';

import 'package:ecomerence_app/common/widget/sucess_screen.dart';
import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //send verify email and Set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verificatiion link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Please Check Your Inbox and Verify Your account');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  //Timer for auto redirect
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();

        Get.off(() => SucessScreen(
            image: TImages.successfulRegisteredAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            button: () => AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //Manually Check Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SucessScreen(
          image: TImages.successfulRegisteredAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          button: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
