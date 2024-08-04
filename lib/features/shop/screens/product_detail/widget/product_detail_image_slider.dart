import 'package:ecomerence_app/common/widget/appbar/appbar.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/curved_edge/curved_edges.dart';
import 'package:ecomerence_app/common/widget/icons/t_circular_Icons.dart';
import 'package:ecomerence_app/dummydata/dummy_data.dart';
import 'package:ecomerence_app/features/shop/screens/home/widgets/banner.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatefulWidget {
  final TDummyData product;

  const TProductImageSlider({
    super.key,
    required this.product,
  });

  @override
  _TProductImageSliderState createState() => _TProductImageSliderState();
}

class _TProductImageSliderState extends State<TProductImageSlider> {
  late String currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.product.thumbnail; // Initial main image
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ClipPath(
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
                      padding:
                          const EdgeInsets.all(TSizes.productImageRadius * 2),
                      child: Center(
                        child: Image.network(
                          currentImage,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  //Image Slider
                  Positioned(
                    right: 0,
                    left: TSizes.defaultSpace,
                    bottom: 30,
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        itemCount: widget.product.images.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentImage = widget.product.images[index];
                            });
                          },
                          child: TBannerImage(
                            imageUrl: widget.product.images[index],
                            isNetworkImage: true,
                            width: 80,
                            padding: const EdgeInsets.all(TSizes.sm),
                            backgroundColor:
                                dark ? TColors.darkerGrey : TColors.white,
                            border: Border.all(color: TColors.primary),
                          ),
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
    );
  }
}
