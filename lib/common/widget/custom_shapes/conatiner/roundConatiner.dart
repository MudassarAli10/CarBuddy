import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TRoundContainer extends StatelessWidget {
  const TRoundContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.child,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.margin,
    this.borderColor = TColors.borderPrimary,
    this.shadowBorder = false,
  });
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double radius;
  final Color backgroundColor;
  final Color borderColor;
  final bool shadowBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: shadowBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
