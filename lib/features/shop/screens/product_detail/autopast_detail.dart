import 'package:ecomerence_app/common/widget/appbar/appbar.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/curved_edge/curved_edges.dart';
import 'package:ecomerence_app/common/widget/icons/t_circular_Icons.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';

import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:ecomerence_app/common/widget/text/section_heading.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:ecomerence_app/dummydata/dummy_autoparts_data.dart';

class AutoPartDetails extends StatelessWidget {
  final TDummyDataAutoParts product;

  const AutoPartDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
            ClipPath(
              clipper: TCustomCurvedEdges(),
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Positioned(
                      top: -150,
                      right: -250,
                      child: TRoundContainer(
                        backgroundColor: TColors.textWhite.withOpacity(0.1),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: -300,
                      child: TRoundContainer(
                        backgroundColor: TColors.textWhite.withOpacity(0.1),
                      ),
                    ),
                    Container(
                      color: dark ? TColors.darkGrey : TColors.light,
                      child: Stack(
                        children: [
                          //Main Large Image
                          SizedBox(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  TSizes.productImageRadius * 2),
                              child: Center(
                                child: Image.network(
                                  product.thumbnail,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          //APP BAR
                          const TAppBar(
                            showBackArrow: true,
                            actions: [
                              TCircularIcons(
                                icon: Iconsax.heart5,
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //--Rating & Share
                 // const TRatingAndShare(),
                  //--Price Title,
                  TSectionHeading(
                    title: 'PKR ${product.price} ',
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
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
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
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to call seller
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Text('Call Seller'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to add to cart
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Text('Add to Cart'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
