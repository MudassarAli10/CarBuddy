import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_cards_vertical.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HyundiaCarScreen extends StatelessWidget {
  const HyundiaCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hyundia Cars',
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
          itemCount: hyundiaCarList.length,
          itemBuilder: (_, index) => TProductCardVertical(
            product: hyundiaCarList[index],
          ),
        ),
      ),
    );
  }
}
