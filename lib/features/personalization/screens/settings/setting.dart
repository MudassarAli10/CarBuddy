import 'package:ecomerence_app/common/widget/List_Tile/setting_menu_tile.dart';
import 'package:ecomerence_app/common/widget/List_Tile/userListTile.dart';
import 'package:ecomerence_app/common/widget/appbar/appbar.dart';
import 'package:ecomerence_app/common/widget/text/section_heading.dart';
import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/features/personalization/screens/delivery_order.dart/delivery_order_screen.dart';
import 'package:ecomerence_app/features/personalization/screens/profile/profile.dart';
import 'package:ecomerence_app/features/shop/screens/mechanic/mechanic.dart';
import 'package:ecomerence_app/features/shop/screens/shop/store_screen.dart';
import 'package:ecomerence_app/features/shop/screens/whishList/whishlist_Screen.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ecomerence_app/common/widget/custom_shapes/curved_edge/curved_edges.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/custom_shapes/conatiner/roundConatiner.dart';
import 'package:get/get.dart';
import 'package:ecomerence_app/features/personalization/screens/chats/chats.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authRepo = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ///=>Header
          ClipPath(
              clipper: TCustomCurvedEdges(),
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Positioned(
                    top: -150,
                    right: -250,
                    child: TRoundContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -300,
                    child: TRoundContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    ),
                  ),
                  Column(
                    children: [
                      TAppBar(
                        title: Text(
                          'Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white),
                        ),
                      ),
                      const TUserProfileListTile(),
                      const SizedBox(
                        height: TSizes.defaultSpace,
                      ),
                    ],
                  )
                ]),
              )),

          ///=>Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //Account Setting
                const TSectionHeading(title: 'More Options'),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TSettingMenuTile(
                  icon: Iconsax.message,
                  title: 'Chats',
                  subTitle: 'All Your Chats as Buyers & Seller',
                  onTap: () => Get.to(() => const ChatScreen()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.heart,
                  title: 'Favourite & Saved Searches',
                  subTitle: 'All Your Favourite Ads & Saved Filtres',
                  onTap: () => Get.to(() => const WhishListScreen()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.eye,
                  title: 'Public Profile',
                  subTitle: 'See how other view your Profiles',
                  onTap: () => Get.to(() => const ProfileScreen()),
                ),
                TSettingMenuTile(
                  icon: Iconsax.card,
                  title: 'Buy Discounted Package',
                  subTitle: 'Sell Faster,more & at higher margins with package',
                  onTap: () => Get.to(() => const StoreScreen()),
                ),
                TSettingMenuTile(
                  icon: Icons.shortcut_sharp,
                  title: 'Find Mechanic',
                  subTitle: 'You can repair your car to your nearest mechanic ',
                  onTap: () => Get.to(() => const MechanicScreen()),
                ),
                TSettingMenuTile(
                  icon: Icons.file_copy,
                  title: 'Orders and Billing Info',
                  subTitle: 'Order,billing and invoices',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.truck,
                  title: 'Delivery Orders',
                  subTitle: 'Track your selling or buying delivery orders',
                  onTap: () => Get.to(() => const DeliveryOrderScreen()),
                ),

                TSettingMenuTile(
                  icon: Iconsax.support5,
                  title: 'Help & Support',
                  subTitle: 'Help Center and legal term',
                  onTap: () {},
                ),
                //APP Setting
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSectionHeading(title: 'Setting'),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TSettingMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Data Load',
                  subTitle: 'Data Load on Our Firebase',
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.location,
                  title: 'Set Your Location',
                  subTitle: 'For Better Result Set Your Location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                  onTap: () {},
                ),
                TSettingMenuTile(
                  icon: Iconsax.location,
                  title: 'Safe Mode',
                  subTitle: 'Search Reasult in safe mode',
                  trailing: Switch(value: false, onChanged: (value) {}),
                  onTap: () {},
                ),

                //LogOut Button
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          authRepo.logout();
                        },
                        child: const Text(
                          'Log Out',
                          style: TextStyle(color: Colors.red),
                        ))),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
