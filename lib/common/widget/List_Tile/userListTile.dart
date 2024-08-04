import 'package:ecomerence_app/common/widget/image/t_circular_image.dart';
import 'package:ecomerence_app/common/widget/shimmerEffect/shimmer_effect_loader.dart';
import 'package:ecomerence_app/features/personalization/controller/usercontroller/user_controller.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/profile.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileListTile extends StatelessWidget {
  const TUserProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return controller.imageUploading.value
            ? const TShimmerEffect(width: 55, height: 55, radius: 55)
            : TCircularImage(
                image: image,
                width: 80,
                height: 80,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(() => const ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
