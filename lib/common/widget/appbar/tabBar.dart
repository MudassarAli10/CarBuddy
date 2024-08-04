import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/device/device_utility.dart';
import 'package:ecomerence_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: THelperFunctions.isDarkMode(context)
            ? TColors.white
            : TColors.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
