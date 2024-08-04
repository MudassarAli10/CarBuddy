import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_cards_vertical.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SuzukiCarScreen extends StatelessWidget {
  const SuzukiCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suzuki Cars',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.white),
        ),
        backgroundColor: TColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TGridLayout(
          itemCount: suzukiCarList.length,
          itemBuilder: (_, index) => TProductCardVertical(
            product: suzukiCarList[index],
          ),
        ),
      ),
    );
  }
}
