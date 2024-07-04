import 'package:flutter/material.dart';
import 'package:refresh/screen/checkout_screen.dart';
import 'package:refresh/screen/product_screen.dart';
import 'package:refresh/widgets/cart.dart';
import 'models/products.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cart = Cart();
  final products = [
    Product(name: 'T-Shirt', price: 19.99),
    Product(name: 'Jeans', price: 49.99),
    Product(name: 'Laptop', price: 799.99),
    Product(name: 'Headphones', price: 99.99),
    Product(name: 'Microwave', price: 79.99),
    Product(name: 'Book', price: 14.99),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shopping App'),
        ),
        body:  _buildScreen(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Checkout',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, // Handle tap events
          selectedItemColor: Colors.red[800],
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return ProductsScreen(products: products, cart: cart);
      case 1:
        return CheckoutScreen(cart: cart);
      default:
        return  ProductsScreen(products: products, cart: cart);
    }
  }
}

