import 'package:ecomerence_app/common/widget/image/t_circular_image.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCategoriesHomeScreen extends StatelessWidget {
  const TCategoriesHomeScreen({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.md * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            //Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: textColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
