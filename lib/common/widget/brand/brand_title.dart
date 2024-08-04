import 'package:ecomerence_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    required this.title,
    required this.maxLine,
    this.textAlign,
    required this.brandTextSizes,
  });

  final Color? color;
  final String title;
  final int maxLine;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSizes == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSizes == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
