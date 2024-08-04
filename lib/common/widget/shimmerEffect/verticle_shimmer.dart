import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/common/widget/shimmerEffect/shimmer_effect_loader.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticleShimmerEffect extends StatelessWidget {
  const TVerticleShimmerEffect({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            TShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
