import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonText = 'View All',
    this.showActionButton = false,
    this.textColor,
    this.onPressed,
  });
  final String title, buttonText;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonText)),
      ],
    );
  }
}
