import 'package:ecomerence_app/features/personalization/controller/usercontroller/user_controller.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re_Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                        prefix: Icon(Iconsax.direct_right),
                        labelText: TTexts.email)),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => TValidator.validatePassword(value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthWithEmailAndPassword(),
                        child: const Text('Verify'))),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
