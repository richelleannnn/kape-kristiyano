import 'package:kape_kristiyano/models/coffee_item.dart';

class MenuService {
  Future<List<CoffeeItem>> getMenuItems() async {
    // Simulate an API call or database query to fetch menu items
    await Future.delayed(Duration(seconds: 2));

    // Mock data from Starbucks
    List<Map<String, dynamic>> starbucksMenu = [
      //Cold Brew Fantasies
      {
        'name': 'Sensation',
        'description':
            'An espresso shot from our 100% KK Arabica beans with a rich combination of chocolate and milk',
        'category': 'Cold Brew Fantasies',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/sensation-500x500-2.png',
        'price': 170.0
      },
      {
        'name': 'Smooth',
        'description':
            'One espresso shot from our 100% KK Arabica beans with a creamy experience from of KK special mix served over ice.',
        'category': 'Cold Brew Fantasies',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/smooth-500x500-1.png',
        'price': 155.0
      },
      {
        'name': 'Strong',
        'description':
            'Double espresso shot from our 100% KK Arabica beans with a creamy experience from of KK special mix served over ice',
        'category': 'Cold Brew Fantasies',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/strong-500x500-1.png',
        'price': 165.0
      },
      {
        'name': 'Super Strong',
        'description':
            'Double espresso shot from our 100% KK Arabica beans for that extra kick, added with cold water to neutralize- served over ice.',
        'category': 'Cold Brew Fantasies',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/super-strong-500x500-1.png',
        'price': 140.0
      },
      //Milk-Based Delights
      {
        'name': 'Strawberry Sensation',
        'description':
            'Combined strawberry flavor from mixed berries coupled with milk for a rich and deep sensation',
        'category': 'Milk-Based Delights',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/strawberry-sensation-500x500-1.png',
        'price': 175.0
      },
      {
        'name': 'Fruity Sensation',
        'description':
            'The flavor will keep you guessing what it is while at the same time keep sipping to your fullest satisfaction',
        'category': 'Milk-Based Delights',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/fruity-sensation-500x500-1.png',
        'price': 175.0
      },
      {
        'name': 'Super Smooth',
        'description':
            'For non-coffee drinker- this is perfect for you. Nothing but creaminess and an out of this world experience',
        'category': 'Milk-Based Delights',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/super-smooth-500x500-1.png',
        'price': 175.0
      },
      //Tea-Based Delights
      {
        'name': 'Fruity Passion',
        'description':
            'Passion fruit, black tea and a delicate mix of ingredients giving a passionate flavor that touches your soul.',
        'category': 'Tea-Based Delights',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/Fruity-Passion500x500.png',
        'price': 145.0
      },
      {
        'name': 'Double Berry Delight',
        'description':
            'Strawberry, raspberry & black tea- mixed altogether for a delightful thirst-quenching experience',
        'category': 'Tea-Based Delights',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/Double-Berry-500x500-1.png',
        'price': 150.0
      },
      // Something Fizzy
      {
        'name': 'Fizzy Berry Delight',
        'description':
            'EMixed berry juice extract with a tad of secret concoction that will make you feel bubbly and light- this is a must try experience',
        'category': 'Something Fizzy',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/fizzy-beery-500x500-1.png',
        'price': 175.0
      },
      {
        'name': 'Fizzy Cucumber Delight',
        'description':
            'Cucumber extract with a tad of secret concoction that will make you feel bubbly and light- this is a must try experience',
        'category': 'Something Fizzy',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/fizzy-cucumber-500x500-1.png',
        'price': 175.0
      },
      {
        'name': 'Fizzy Lemon Delight',
        'description':
            'A squeeze of lemon with a tad of secret concoction that will make you feel bubbly and light- this is a must try experience',
        'category': 'Something Fizzy',
        'img':
            'https://kapekristiano.com/wp-content/uploads/2023/05/fizzy-lemon-500x500-1.png',
        'price': 175.0
      },
      // Add more menu items as needed
    ];

    List<CoffeeItem> menuItems = starbucksMenu.map((item) {
      return CoffeeItem(
        name: item['name'],
        description: item['description'],
        price: item['price'] as double,
        category: item['category'],
        img: item['img'],
      );
    }).toList();

    return menuItems;
  }
}
