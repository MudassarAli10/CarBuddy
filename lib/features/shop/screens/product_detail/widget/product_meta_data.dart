import 'package:ecomerence_app/common/widget/icons/t_circular_Icons.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/product_detail/widget/product_menu.dart';

import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class TProductMetaData extends StatelessWidget {
  final TDummyData product;

  const TProductMetaData({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //--Price & Sale Price
        TSectionHeading(
          title: 'PKR ${product.price} Lac',
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //--Title
        TSectionHeading(title: product.name),
        //--location
        Row(
          children: [
            const TCircularIcons(
              icon: Iconsax.location,
              color: TColors.primary,
            ),
            Text(
              product.location,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const TCircularIcons(
                    icon: Iconsax.calendar_25,
                    color: TColors.primary,
                  ),
                  Text(
                    product.model,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const TCircularIcons(
                    icon: CupertinoIcons.car_detailed,
                    color: TColors.primary,
                  ),
                  Text(
                    product.fueltype,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const TCircularIcons(
                    icon: Icons.speed,
                    color: TColors.primary,
                  ),
                  Text(
                    product.mileage,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const TCircularIcons(
                    icon: CupertinoIcons.car_detailed,
                    color: TColors.primary,
                  ),
                  Text(
                    product.factor,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        TProductMenu(title: 'Registered In', value: product.register),
        const Divider(),
        TProductMenu(title: 'Exterior Color', value: product.exterior),
        const Divider(),
        TProductMenu(title: 'Assembly', value: product.assembly),
        const Divider(),
        TProductMenu(title: 'Engine Capacity', value: product.engine),
        const Divider(),
        TProductMenu(title: 'Body Type', value: product.body),
        const Divider(),
        TProductMenu(
          title: 'Last Update',
          value: product.lastupdate != null
              ? product.lastupdate.toString()
              : 'Not available',
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        //Description
        const TSectionHeading(title: 'Description'),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          product.description,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show More',
          trimExpandedText: 'Show Less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
