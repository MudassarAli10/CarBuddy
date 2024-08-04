import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductMenu extends StatelessWidget {
  const TProductMenu({
    super.key,
    //this.icon = Iconsax.arrow_right_34,
    required this.title,
    required this.value,
    this.onPressed,
  });
  //final IconData icon;
  final String title, value;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            )),
            Expanded(
                child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}
