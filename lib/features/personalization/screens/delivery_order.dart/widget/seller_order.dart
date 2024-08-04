import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SellerOrderScreen extends StatefulWidget {
  const SellerOrderScreen({super.key});

  @override
  _SellerOrderScreenState createState() => _SellerOrderScreenState();
}

class _SellerOrderScreenState extends State<SellerOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)

              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Seller',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Buyer',
                ),
              ],
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Buyer ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Seller ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
