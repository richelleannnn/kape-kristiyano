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
  int _currentIndex = 0;

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 105, 56),
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'assets/images/logo-white.png', // Replace 'assets/logo.png' with the actual path to your logo image
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
        title: Text(''),
      ),
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                selectedItemColor: Color.fromARGB(255, 159, 105, 56),
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home,
                      color: const Color.fromARGB(255, 97, 95, 95),
                    ),
                    activeIcon: Icon(
                      Icons.home,
                      color: const Color.fromARGB(255, 159, 105, 56),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history,
                      color: const Color.fromARGB(255, 97, 95, 95),
                    ),
                    activeIcon: Icon(
                      Icons.history,
                      color: const Color.fromARGB(255, 159, 105, 56),
                    ),
                    label: 'Activity',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: const Color.fromARGB(255, 97, 95, 95),
                    ),
                    activeIcon: Icon(
                      Icons.shopping_cart,
                      color: const Color.fromARGB(255, 159, 105, 56),
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle,
                      color: const Color.fromARGB(255, 97, 95, 95),
                    ),
                    activeIcon: Icon(
                      Icons.account_circle,
                      color: const Color.fromARGB(255, 159, 105, 56),
                    ),
                    label: 'Account',
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
