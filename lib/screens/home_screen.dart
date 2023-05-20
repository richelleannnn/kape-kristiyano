// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kape_kristiyano/models/coffee_item.dart';
import 'account_screen.dart';
import 'active_orders_screen.dart';
import 'menu_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CoffeeItem> menuItems = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MenuScreen(),
      ActiveOrdersScreen(),
      CartScreen(),
      AccountScreen(),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                'assets/images/logo.png', // Replace 'assets/logo.png' with the actual path to your logo image
                width: 100.0,
                height: 100.0,
              ),
            ),
          ),
          title: Text(''),
        ),
        body: SafeArea(
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
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
        ));
  }
}
