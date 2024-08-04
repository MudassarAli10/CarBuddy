import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/loginScreen/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  ///Update Current Index when page is scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected Page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update Current Index and Jump to next screen
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final Storage = GetStorage();
      Storage.write('IsFirstTime', false);
      Get.offAll(() =>
          const LoginScreen()); // Use lambda function to instantiate LoginScreen
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}

  /*Update Current Index and Jump to next screen
  void skipPage(index) {
    currentPageIndex.value = 0;
    pageController.jumpTo(0);
  }*/

