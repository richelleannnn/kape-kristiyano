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
      categories = menuItems.map((item) => item.category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                'https://kapekristiano.com/wp-content/uploads/2023/05/297272563_1249217379157329_5716517225364681815_n.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                // Wrap with Container or Expanded
                height: double
                    .infinity, // Provide a fixed height or use double.infinity
                child: MenuListView(
                  menuItems: menuItems,
                  categories: categories,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
