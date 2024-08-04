import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularIcons extends StatelessWidget {
  const TCircularIcons({
    super.key,
    this.height,
    this.width,
    this.size,
    this.color,
    this.backgroundColor,
    required this.icon,
    this.onPressed,
  });
  final double? height, width, size;
  final Color? color;
  final Color? backgroundColor;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.1)
                : TColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
