import 'package:ecomerence_app/common/widget/brand/brandCard.dart';
import 'package:ecomerence_app/common/widget/layout/grid_layout.dart';
import 'package:ecomerence_app/dummydata/brand_list.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllCarBrands extends StatelessWidget {
  const SeeAllCarBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feature Brand',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TGridLayout(
            mainAxisExtent: 80,
            itemCount: brandList.length,
            itemBuilder: (_, index) {
              return TBrandCard(
                showBorder: true,
                onTap: () {
                  // Define what happens when an item is tapped
                  if (index == 0) {
                    Get.to(() {});
                  } else if (index == 1) {
                    Get.to(() {});
                  } else if (index == 2) {
                    Get.to(() {});
                  } else if (index == 3) {
                    Get.to(() {});
                  }
                  // Add more conditions for other items if needed
                },
                brand: brandList[index],
              );
            }),
      ),
    );
  }
}
