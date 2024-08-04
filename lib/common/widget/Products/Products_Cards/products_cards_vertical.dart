import 'package:ecomerence_app/common/style/Shadow.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/common/widget/text/product_title_text.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/home/widgets/banner.dart';
import 'package:ecomerence_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/T_circular_Icons.dart';

class TProductCardVertical extends StatelessWidget {
  final TDummyData product;

  const TProductCardVertical({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            TRoundContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TBannerImage(
                      imageUrl: product.thumbnail,
                      applyBorderRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  /*TRoundContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),*/
                  const Positioned(
                      top: -12,
                      right: -12,
                      child: TCircularIcons(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.name,
                    smallSize: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        product.brand,
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Text(
                    'RS ${product.price} lac',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusSm),
                      )),
                  child: const SizedBox(
                    width: TSizes.iconSm * 1.8,
                    height: TSizes.iconSm * 1.8,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsListView extends StatefulWidget {
  final List<List<TDummyData>> productsLists;
  final List<String> tabTitles;

  const ProductsListView(
      {super.key, required this.productsLists, required this.tabTitles});

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.productsLists.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        bottom: TabBar(
          controller: _tabController,
          tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.productsLists.map((productList) {
          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return TProductCardVertical(product: productList[index]);
            },
          );
        }).toList(),
      ),
    );
  }
}
