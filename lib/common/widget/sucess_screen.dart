import 'package:ecomerence_app/common/style/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.button});
  final String image, title, subtitle;
  final VoidCallback button;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            ///Image
            Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///Titl & Subtile
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///Button

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: button, child: const Text(TTexts.tContinue))),
          ],
        ),
      )),
    );
  }
}
