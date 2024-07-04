import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: InkWell(
        child: Center(
          child: Text(
            "Your order was Successful"
          ),
        ),
      ),
    ));
  }
}
