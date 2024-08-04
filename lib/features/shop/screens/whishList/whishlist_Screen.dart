import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whishlist'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /*
              TGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return const TProductCardVertical();
                  })*/
            ],
          ),
        ),
      ),
    );
  }
}
