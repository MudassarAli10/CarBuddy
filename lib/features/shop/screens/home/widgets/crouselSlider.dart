import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/features/shop/controller/home_controller.dart';
import 'package:ecomerence_app/features/shop/screens/home/widgets/banner.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banner,
  });
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(homeController());
    return Column(
      children: [
        CarouselSlider(
          items: banner.map((url) => TBannerImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banner.length; i++)
                  TRoundContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
