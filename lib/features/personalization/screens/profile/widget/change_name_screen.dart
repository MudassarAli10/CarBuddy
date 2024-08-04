import 'package:ecomerence_app/features/personalization/controller/controller.update/update_dataController.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              'Change Name',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),
            Text(
              'Use Real Data For Easy Verification. This Data will be appear on several pages,',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //TextForm
            Form(
              key: controller.updateUsreNameFormKey,
              child: Column(children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: ((value) =>
                      TValidator.validateEmptyText('FirstName', value!)),
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct), labelText: 'FirstName'),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.lastName,
                  validator: ((value) =>
                      TValidator.validateEmptyText('LastName', value!)),
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct), labelText: 'LastName'),
                ),
              ]),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems * 2,
            ),
            //Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () => controller.updateUserName(),
                ))
          ],
        ),
      ),
    );
  }
}
