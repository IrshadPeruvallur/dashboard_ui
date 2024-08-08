import 'package:dashboard_ui/view/widgets/catogory_perfomance_projection.dart';
import 'package:dashboard_ui/view/widgets/communication_card.dart';
import 'package:dashboard_ui/view/widgets/product_table.dart';
import 'package:dashboard_ui/view/widgets/revenue.dart';
import 'package:dashboard_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_ui/view/widgets/quick_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen = constraints.maxWidth <= 550;
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 252, 253, 255),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            title: DropdownButton<String>(
              style: const TextStyle(color: Colors.black),
              dropdownColor: Colors.white,
              hint: const CustomText(
                text: 'This Month',
                size: 13,
                color: Color.fromARGB(255, 210, 210, 210),
              ),
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text('January'),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text('February'),
                ),
              ],
              onChanged: (value) {},
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
          drawer: isSmallScreen
              ? Drawer(
                  width: 20,
                  child: _buildSidebarMenu(),
                )
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSmallScreen)
                Container(
                  width: 50,
                  child: _buildSidebarMenu(),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            QuickButtonWidget(
                                iconBackgroundColor: Colors.red,
                                title: 'Orders',
                                count: '3',
                                imagePath: 'assets/icons/order.png'),
                            QuickButtonWidget(
                                iconBackgroundColor: Colors.blue,
                                title: 'Estimates',
                                count: '3',
                                imagePath: 'assets/icons/estimate.png'),
                            QuickButtonWidget(
                                iconBackgroundColor:
                                    Color.fromARGB(255, 209, 255, 235),
                                title: 'Pre-Orders',
                                count: '3',
                                imagePath: 'assets/icons/pre_order.png'),
                            QuickButtonWidget(
                                iconBackgroundColor:
                                    Color.fromARGB(255, 236, 255, 232),
                                title: 'Draft',
                                count: '3',
                                imagePath: 'assets/icons/draft.png'),
                            QuickButtonWidget(
                                iconBackgroundColor:
                                    Color.fromARGB(255, 236, 255, 232),
                                title: 'Cancelled',
                                count: '3',
                                imagePath: 'assets/icons/draft.png'),
                          ],
                        ),
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isSmallScreen ? 1 : 2,
                          crossAxisSpacing: 6,
                          childAspectRatio: 3 / 2.5,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) => [
                          CatogoryPerfomanceProjection(),
                          RevenueChart(
                            heading: 'Revenue',
                            chartData: [
                              SalesData('Booking', 0),
                              SalesData('Orders', 3329),
                            ],
                            categoryColors: {
                              'Booking': Color.fromARGB(255, 18, 18, 75),
                              'Orders': Color.fromARGB(255, 204, 156, 60),
                            },
                          ),
                          CommunicationCard(),
                          ProductTable(),
                          RevenueChart(
                            heading: 'Collection',
                            chartData: [
                              SalesData('Completed', 0),
                              SalesData('Pending', 3359),
                              SalesData('Due', 2356),
                              SalesData('Overdue', 0),
                            ],
                            categoryColors: {
                              'Completed': Color.fromARGB(255, 145, 156, 159),
                              'Pending': Color.fromARGB(255, 119, 0, 0),
                              'Due': Color.fromARGB(255, 204, 156, 60),
                              'Overdue': Color.fromARGB(255, 193, 156, 82),
                            },
                          ),
                          RevenueChart(
                            heading: 'Order Status',
                            chartData: [
                              SalesData('Processing', 0),
                              SalesData('Packed For Delivery', 0),
                              SalesData('Out of Delivery', 0),
                              SalesData('Delivered', 2254),
                            ],
                            categoryColors: {
                              'Processing':
                                  const Color.fromARGB(255, 7, 25, 39),
                              'Packed For Delivery':
                                  Color.fromARGB(255, 38, 51, 114),
                              'Out of Delivery':
                                  const Color.fromARGB(255, 179, 169, 75),
                              'Delivered':
                                  const Color.fromARGB(255, 76, 160, 175),
                            },
                          ),
                        ][index],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Sidebar menu widget
  Widget _buildSidebarMenu() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.dashboard, color: Colors.indigo),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_cart, color: Colors.grey[400]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.assessment, color: Colors.grey[400]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.reorder, color: Colors.grey[400]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.drafts, color: Colors.grey[400]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.cancel, color: Colors.grey[400]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings, color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
