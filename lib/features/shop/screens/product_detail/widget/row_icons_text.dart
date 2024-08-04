import 'package:ecomerence_app/common/widget/icons/t_circular_Icons.dart';
import 'package:flutter/material.dart';

class TRowIconsWithText extends StatelessWidget {
  const TRowIconsWithText({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcons(
          icon: icon,
          color: Colors.blue,
        ),
        Text(title),
      ],
    );
  }
}
