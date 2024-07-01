import 'package:flutter/material.dart';

import '../models/products.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({super.key});

  final List<Product>productList=[
    const Product("Apples", 40),
    const Product("Shirts", 400),
    const Product("Laptop", 1999),
    const Product("Chair", 150),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),
        ),
      ),
      body: Container(

      ),
    ));
  }
}
