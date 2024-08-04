import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_cards_vertical.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/customSearchBar.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/curved_edge/curved_edges.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:ecomerence_app/dummydata/categories_list.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/home/categoryScreen/autopart_screen.dart';
import 'package:ecomerence_app/features/shop/screens/home/categoryScreen/cheap_car_screen.dart';
import 'package:ecomerence_app/features/shop/screens/home/categoryScreen/new_car_screen.dart';
import 'package:ecomerence_app/features/shop/screens/home/categoryScreen/used_car_screen.dart';
import 'package:ecomerence_app/features/shop/screens/home/widgets/crouselSlider.dart';
import 'package:ecomerence_app/features/shop/screens/home/widgets/homeAppBar.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
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
                    Column(
                      children: [
                        const THomeAppBar(),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        const TSearchBar(
                          title: 'Search In Store',
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: TSizes.defaultSpace),
                          child: Column(
                            children: [
                              const TSectionHeading(
                                title: 'Popular Categories',
                                showActionButton: false,
                                textColor: TColors.white,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              // Categories
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  itemCount: categoriesList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final category = categoriesList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        // Define what happens when an item is tapped
                                        if (index == 0) {
                                          Get.to(const NewCarScreen());
                                        } else if (index == 1) {
                                          Get.to(const UsedCarScreen());
                                        } else if (index == 2) {
                                          Get.to(const CheapCarScreen());
                                        } else if (index == 3) {
                                          Get.to(const AutoPartScreen());
                                        }
                                        // Add more conditions for other items if needed
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: TSizes.spaceBtwItems),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(
                                                  TSizes.sm),
                                              height: 56,
                                              width: 56,
                                              decoration: BoxDecoration(
                                                color: TColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: category.image
                                                      .endsWith('.svg')
                                                  ? SvgPicture.network(
                                                      category.image,
                                                      placeholderBuilder:
                                                          (BuildContext
                                                                  context) =>
                                                              const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                  : Image.network(
                                                      category.image,
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        } else {
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
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
                                            const SizedBox(
                                              height: TSizes.spaceBtwItems / 2,
                                            ),
                                            Text(
                                              category.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .apply(color: TColors.white),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: TSizes.defaultSpace * 2,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banner: [
                      TImages.banner9,
                      TImages.banner10,
                      TImages.banner11,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return TProductCardVertical(
                        product: newCarList[index],
                      );
                    },
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
