import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/common/widget/image/t_circular_image.dart';
import 'package:ecomerence_app/dummydata/brand_list.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });
  final bool showBorder;
  final void Function()? onTap;
  final TDummyDataBrand brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        shadowBorder: showBorder,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: TCircularImage(
                image: brand.thumbnail,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.dark,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            //Text
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brand.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "${brand.items} Products",
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
