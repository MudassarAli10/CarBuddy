import 'package:ecomerence_app/common/widget/Products/products_cart/cart_menu_icon.dart';
import 'package:ecomerence_app/common/widget/shimmerEffect/shimmer_effect_loader.dart';
import 'package:ecomerence_app/features/personalization/controller/usercontroller/user_controller.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/appbar/appbar.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(
                width: 80,
                height: 15,
              );
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: [
        TCartCounterItem(
          onPressed: () {},
          itemColor: TColors.white,
        ),
      ],
    );
  }
}
