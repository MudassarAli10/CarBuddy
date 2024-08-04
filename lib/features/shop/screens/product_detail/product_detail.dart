import 'package:ecomerence_app/common/widget/image/t_circular_image.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/product_detail/widget/product_detail_image_slider.dart';
import 'package:ecomerence_app/features/shop/screens/product_detail/widget/product_meta_data.dart';
import 'package:ecomerence_app/features/shop/screens/product_detail/widget/row_icons_text.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final TDummyData product;

  const ProductDetails({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
            TProductImageSlider(
              product: product,
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
                //  const TRatingAndShare(),
                  //--Price Title,
                  TProductMetaData(
                    product: product,
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
            left: TSizes.defaultSpace, right: TSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
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
                      Text('Call Seller')
                    ],
                  )),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TRowIconsWithText(
                  icon: Icons.chat,
                  title: 'SMS',
                ),
                TRowIconsWithText(
                  icon: Icons.chat_bubble_outlined,
                  title: 'Chat',
                ),
                Row(
                  children: [
                    TCircularImage(
                      height: 40,
                      width: 40,
                      image: TImages.whatsapp,
                    ),
                    Text('Whatsapp'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
