import 'package:flutter/material.dart';
import '../widgets/cart.dart';

class CheckoutScreen extends StatelessWidget {
  final Cart cart;

  const CheckoutScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cart.items.isEmpty
          ? Container(
        color: Colors.white,
        child: const Center(
          child: Text('Your cart is empty!'),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                      'x${product.quantity} - \$${(product.price * product.quantity).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal:', style: TextStyle(fontSize: 16.0)),
                Text(
                  '\$${cart.getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: cart.items.isEmpty,
              child: const Text('Cart is Empty'),
            ),
            ElevatedButton(
              onPressed: cart.items.isEmpty ? null : () {

              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
