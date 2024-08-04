import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_card_verticle_autopart.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/dummydata/dummy_autoparts_data.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AutoPartScreen extends StatelessWidget {
  const AutoPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Autoparts',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.white),
        ),
        backgroundColor: TColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TGridLayout(
            itemCount: autopartlist.length,
            itemBuilder: (_, index) => TProductCardAutoparts(
              product: autopartlist[index],
            ),
          ),
        ),
      ),
    );
  }
}
