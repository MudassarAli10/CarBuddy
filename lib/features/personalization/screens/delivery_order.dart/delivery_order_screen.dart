import 'package:ecomerence_app/common/widget/List_Tile/setting_menu_tile.dart';
import 'package:ecomerence_app/features/personalization/screens/delivery_order.dart/widget/buyers_order.dart';
import 'package:ecomerence_app/features/personalization/screens/delivery_order.dart/widget/seller_order.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DeliveryOrderScreen extends StatelessWidget {
  const DeliveryOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Order',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: TSizes.sm),
        child: Column(
          children: [
            TSettingMenuTile(
                icon: Iconsax.add,
                title: 'Buying Orders',
                subTitle: 'See Your Active or Archived Buying',
                onTap: () {
                  Get.to(() => const BuyersOrderScreen());
                }),
            TSettingMenuTile(
                icon: Icons.sell_sharp,
                title: 'Selling Orders',
                subTitle: 'See Your Active or Archived Buying',
                onTap: () {
                  Get.to(() => const SellerOrderScreen());
                }),
          ],
        ),
      ),
    );
  }
}
