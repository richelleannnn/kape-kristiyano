// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kape_kristiyano/models/coffee_item.dart';
import 'package:kape_kristiyano/services/menu_service.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<CoffeeItem> menuItems = [];

  @override
  void initState() {
    super.initState();
    fetchMenuItems();
  }

  void fetchMenuItems() async {
    List<CoffeeItem> items = await MenuService().getMenuItems();
    setState(() {
      menuItems = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                // Get the current menu item
                CoffeeItem item = menuItems[index];

                // Check if it's the first item or if the category is different from the previous item
                bool isFirstItem = index == 0 ||
                    item.category != menuItems[index - 1].category;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (isFirstItem)
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                        child: Text(
                          item.category,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ListTile(
                      leading: Image.network(
                        item.img,
                        width: 100.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.description),
                      trailing: Text('\₱${item.price.toStringAsFixed(2)}'),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
