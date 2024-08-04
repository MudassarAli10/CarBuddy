import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterItem extends StatelessWidget {
  const TCartCounterItem({
    super.key,
    required this.onPressed,
    required this.itemColor,
  });
  final VoidCallback onPressed;
  final Color? itemColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: itemColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: TColors.black),
            child: Center(
                child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: TColors.white),
            )),
          ),
        )
      ],
    );
  }
}
