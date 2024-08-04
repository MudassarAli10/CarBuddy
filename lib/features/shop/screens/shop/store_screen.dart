import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_card_verticle_autopart.dart';
import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_cards_vertical.dart';
import 'package:ecomerence_app/common/widget/brand/brandCard.dart';
import 'package:ecomerence_app/common/widget/Products/products_cart/cart_menu_icon.dart';
import 'package:ecomerence_app/common/widget/appbar/appbar.dart';
import 'package:ecomerence_app/common/widget/appbar/tabBar.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/customSearchBar.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:ecomerence_app/dummydata/brand_list.dart';
import 'package:ecomerence_app/dummydata/dummy_autoparts_data.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/honda_Screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/hyundi_screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/kia_screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/mg_screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/suzuki_screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/featuredBrandsScreens/toyota_screen.dart';
import 'package:ecomerence_app/features/shop/screens/shop/widget/floating_Action_button.dart';
import 'package:ecomerence_app/features/shop/screens/shop/widget/see_all_brand.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterItem(
              onPressed: () {},
              itemColor: null,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Search BAr
                      //SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchBar(
                        title: "Search In Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      //Feature Brand
                      TSectionHeading(
                        title: 'Feature Brand',
                        showActionButton: true,
                        onPressed: () => Get.to(() => const SeeAllCarBrands()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      TGridLayout(
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return TBrandCard(
                              showBorder: true,
                              onTap: () {
                                // Define what happens when an item is tapped
                                if (index == 0) {
                                  Get.to(() => const SuzukiCarScreen());
                                } else if (index == 1) {
                                  Get.to(() => const MgCarScreen());
                                } else if (index == 2) {
                                  Get.to(() => const HyundiaCarScreen());
                                } else if (index == 3) {
                                  Get.to(() => const ToyotaCarScreen());
                                } else if (index == 4) {
                                  Get.to(() => const HondaCarScreen());
                                } else if (index == 5) {
                                  Get.to(() => const KiaCarScreen());
                                }
                                // Add more conditions for other items if needed
                              },
                              brand: brandList[index],
                            );
                          })
                    ],
                  ),
                ),
                bottom: const TTabbar(tabs: [
                  Tab(
                    child: Text('New Car'),
                  ),
                  Tab(
                    child: Text('Used Car'),
                  ),
                  Tab(
                    child: Text('Cheap Car'),
                  ),
                  Tab(
                    child: Text('AutoStore'),
                  )
                ]),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TabBarView(children: [
              TGridLayout(
                itemCount: newCarList.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: newCarList[index],
                ),
              ),
              TGridLayout(
                itemCount: newCarList.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: newCarList[index],
                ),
              ),
              TGridLayout(
                itemCount: kiaCarList.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: kiaCarList[index],
                ),
              ),
              TGridLayout(
                itemCount: autopartlist.length,
                itemBuilder: (_, index) => TProductCardAutoparts(
                  product: autopartlist[index],
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: const TFloatingActionButton(),
      ),
    );
  }
}
