import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BuyersOrderScreen extends StatefulWidget {
  const BuyersOrderScreen({super.key});

  @override
  _BuyersOrderScreenState createState() => _BuyersOrderScreenState();
}

class _BuyersOrderScreenState extends State<BuyersOrderScreen>
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
          'Buyers Order',
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
                  text: 'Active',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Archive',
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
                      'Active ',
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
