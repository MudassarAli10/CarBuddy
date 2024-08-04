import 'package:ecomerence_app/features/authentication/controller/controller.signup/singn_up_controller.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:ecomerence_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Form
              Form(
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.firstname,
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'FirstName', value!),
                              expands: false,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.user),
                                  labelText: TTexts.firstName),
                            ),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwInputFields,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'LastName', value!),
                              controller: controller.lastname,
                              expands: false,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.user),
                                  labelText: TTexts.lastName),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      //UserName
                      TextFormField(
                        controller: controller.username,
                        validator: (value) =>
                            TValidator.validateEmptyText('UserName', value!),
                        expands: false,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.user),
                            labelText: TTexts.username),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      //Email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => TValidator.validateEmail(value),
                        expands: false,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct),
                            labelText: TTexts.email),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      //Phone Number
                      TextFormField(
                        controller: controller.phoneNumber,
                        validator: (value) =>
                            TValidator.validatePhoneNumber(value),
                        expands: false,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: TTexts.phoneNo),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      //Password
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          obscureText: controller.hidePaswword.value,
                          validator: (value) =>
                              TValidator.validatePassword(value),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.password_check),
                              labelText: TTexts.password,
                              suffixIcon: IconButton(
                                  onPressed: () => controller.hidePaswword
                                      .value = !controller.hidePaswword.value,
                                  icon: Icon(controller.hidePaswword.value
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye))),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Obx(
                              () => Checkbox(
                                onChanged: (value) {
                                  controller.privacyPolicy.value =
                                      !controller.privacyPolicy.value;
                                },
                                value: controller.privacyPolicy.value,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: TTexts.iAgreeTo,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: TTexts.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      )),
                              TextSpan(
                                  text: TTexts.and,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: TTexts.termsOfUse,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      )),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      //Sign up Button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => controller.signup(),
                              child: const Text(TTexts.createAccount))),

                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
                  )),

              ///Divider

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    TTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () => controller.googleSignIn(),
                      icon: const Image(
                        image: AssetImage(TImages.google),
                        height: TSizes.iconMd,
                        width: TSizes.iconMd,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage(TImages.facebook),
                        height: TSizes.iconMd,
                        width: TSizes.iconMd,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
