// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kape_kristiyano/models/coffee_item.dart';
import 'package:kape_kristiyano/services/menu_service.dart';
import 'package:kape_kristiyano/widgets/menu_listview.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<CoffeeItem> menuItems = [];
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    fetchMenuItems();
  }

  void fetchMenuItems() async {
    List<CoffeeItem> items = await MenuService().getMenuItems();
    setState(() {
      menuItems = items;

      // Extract unique categories from menuItems
      categories = menuItems.map((item) => item.category).toSet().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CoffeeItem>>(
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.network(
                    'https://kapekristiano.com/wp-content/uploads/2023/05/297272563_1249217379157329_5716517225364681815_n.jpg',
                    fit: BoxFit.cover,
                  ),
                ), // Replace BannerWidget with your own banner widget
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, categoryIndex) {
                    String category = categories[categoryIndex];
                    List<CoffeeItem> itemsInCategory = menuItems
                        .where((item) => item.category == category)
                        .toList();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0, 20),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 0, // Reduce bottom space
                            crossAxisSpacing: 1.0, // Add spacing between items
                          ),
                          itemCount: itemsInCategory.length,
                          itemBuilder: (context, index) {
                            CoffeeItem currentItem = itemsInCategory[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Card(
                                    color: Colors.black,
                                    child: Image.network(
                                      currentItem.img,
                                      fit: BoxFit.cover,
                                      height: 170,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentItem.name,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        currentItem.description.replaceRange(
                                            20,
                                            currentItem.description.length,
                                            '...'),
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        '\₱${currentItem.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
