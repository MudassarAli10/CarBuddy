import 'package:ecomerence_app/features/authentication/controller/controller.login/log_in_controller.dart';
import 'package:ecomerence_app/features/authentication/screens/password_configration/forget_password.dart';
import 'package:ecomerence_app/features/authentication/screens/sign_up_Screen/sign_up.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:ecomerence_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/style/spacing_styles.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and SubTitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                    height: 100,
                  ),
                  Text(
                    TTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Text(
                    TTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              // Form
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => TValidator.validateEmail(value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields,
                      ),
                      // Password
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          obscureText: controller.hidePassword.value,
                          validator: (value) =>
                              TValidator.validatePassword(value),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: TTexts.password,
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputFields / 2,
                      ),
                      // Remember Me & Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember Me
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) => controller.rememberMe
                                      .value = !controller.rememberMe.value,
                                ),
                              ),
                              const Text(TTexts.rememberMe),
                            ],
                          ),
                          // Forget Password
                          TextButton(
                            onPressed: () =>
                                Get.to(() => const ForgetPassword()),
                            child: const Text(TTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      // Sign in Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.emailAndPasswordSignin(),
                          child: const Text(TTexts.signIn),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(const SignUpScreen());
                          },
                          child: const Text(TTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Divider
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
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Footer
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
