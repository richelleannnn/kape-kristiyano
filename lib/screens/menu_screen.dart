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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7, // Adjust the aspect ratio as needed
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            CoffeeItem currentItem = menuItems[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            20, currentItem.description.length, '...'),
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
      ),
    );
  }
}
