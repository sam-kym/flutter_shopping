import 'package:flutter/material.dart';

import '../models/products.dart';
import '../widgets/cart.dart';
import 'checkout_screen.dart';


class ProductsScreen extends StatelessWidget {
  final List<Product> products;
  final Cart cart;

  const ProductsScreen({super.key, required this.products, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addProductToCart(product),
                  ),
                  Text('${product.quantity}'),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: product.quantity > 0 ? () => _removeProductFromCart(product) : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(cart: cart))),
      ),
    );
  }

  void _addProductToCart(Product product) {
    cart.addProduct(product);
  }

  void _removeProductFromCart(Product product) {
    cart.removeProduct(product);
  }
}
