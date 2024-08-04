import 'package:ecomerence_app/data/repository/user/user_repository.dart';
import 'package:ecomerence_app/features/personalization/controller/usercontroller/user_controller.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/profile.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/popups/full_screen_loader.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsreNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initilizeName();
    super.onInit();
  }

  Future<void> initilizeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          "We are Updateing Your InFormation", TImages.docerAnimation);
      if (!updateUsreNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your Data Has been Changed Sucessfully');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OK Snap', message: e.toString());
    }
  }
}
