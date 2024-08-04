import 'package:ecomerence_app/features/authentication/controller/controller.forgetPassword/forget_password_controller.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),
            //TextForm
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                expands: false,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),
            //Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(TTexts.submit),
                  onPressed: () => controller.sendPasswordResetEmail(),
                ))
          ],
        ),
      ),
    );
  }
}
