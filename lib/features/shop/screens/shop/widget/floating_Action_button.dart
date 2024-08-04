import 'package:ecomerence_app/features/shop/product_Add_form/product_add_form.dart';
import 'package:ecomerence_app/features/shop/product_Add_form/product_add_form_autoparts.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFloatingActionButton extends StatelessWidget {
  const TFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () {
          // Show SnackBar with two icon buttons
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: TColors.white,
              content: Column(
                children: [
                  Text(
                    'What do you want to sell?',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: TColors.black),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () => Get.to(() => VehicleForm()),
                              icon: const Icon(
                                Iconsax.car,
                                color: TColors.black,
                              )),
                          Text(
                            'Vehicles',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () =>
                                  Get.to(() => const AutoPartsForm()),
                              icon: const Icon(
                                Icons.two_wheeler,
                                color: TColors.black,
                              )),
                          Text(
                            'Auto Parts',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .apply(color: TColors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              behavior: SnackBarBehavior.fixed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
        child: Text(
          'Sell',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: TColors.white),
        ));
  }
}
