import 'package:ecomerence_app/common/widget/appbar/appbar.dart';
import 'package:ecomerence_app/common/widget/image/t_circular_image.dart';
import 'package:ecomerence_app/common/widget/shimmerEffect/shimmer_effect_loader.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:ecomerence_app/features/personalization/controller/usercontroller/user_controller.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/widget/change_name_screen.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              //Profile Picture
              Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image =
                    networkImage.isNotEmpty ? networkImage : TImages.user;
                return controller.imageUploading.value
                    ? const TShimmerEffect(width: 55, height: 55, radius: 55)
                    : TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
              }),
              TextButton(
                  onPressed: () => controller.uploadUserProfilePicture(),
                  child: const Text('Change Your Profile')),
              //Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(title: 'Profile Information'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeNameScreen()),
              ),
              TProfileMenu(
                title: 'username',
                value: controller.user.value.username,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(title: 'Personal Information'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'User-ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Age',
                value: '22',
                onPressed: () {},
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account',
                        style: TextStyle(
                          color: Colors.red,
                        ))),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
