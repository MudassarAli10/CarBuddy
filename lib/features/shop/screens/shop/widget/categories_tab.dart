import 'package:ecomerence_app/common/widget/Products/Products_Cards/products_cards_vertical.dart';
import 'package:ecomerence_app/common/widget/brand/brand_Show_case.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/model/category_model.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoriesTab extends StatelessWidget {
  const TCategoriesTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProductController());
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TTBrandShowCase(
                  images: [
                    TImages.productImagecar1,
                    TImages.productImagecar2,
                    TImages.productImagecar3
                  ],
                ),
                TSectionHeading(
                  title: 'You might like',
                  showActionButton: true,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => TProductCardVertical(
                    product: newCarList[index],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ]);
  }
}
