import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTBrandShowCase extends StatelessWidget {
  const TTBrandShowCase({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images; // Change to List<String> to represent image paths

  @override
  Widget build(BuildContext context) {
    return TRoundContainer(
      shadowBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: TColors.darkGrey,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /* TBrandCard(
            showBorder: false,
            onTap: () {},
            //brand: brandList.isEmpty.noSuchMethod(42 as Invocation),
          ),*/
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            children: images
                .map((image) => brandTopProductImagesWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImagesWidget(String imagePath, BuildContext context) {
    // Change parameter type to String
    return Expanded(
      child: TRoundContainer(
        margin: const EdgeInsets.only(left: TSizes.sm),
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          image: AssetImage(imagePath), // Use imagePath instead of images
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
