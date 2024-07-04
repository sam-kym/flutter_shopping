import '../models/products.dart';

class Cart {
  final List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
  }

  void removeProduct(Product product) {
    items.remove(product);
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var product in items) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }
}
