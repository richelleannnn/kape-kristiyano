// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kape_kristiyano/models/coffee_item.dart';

class MenuListView extends StatelessWidget {
  final List<CoffeeItem> menuItems;
  final List<String> categories;

  const MenuListView({
    required this.menuItems,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        String category = categories[categoryIndex];
        List<CoffeeItem> itemsInCategory =
            menuItems.where((item) => item.category == category).toList();

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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          ],
        );
      },
    );
  }
}
