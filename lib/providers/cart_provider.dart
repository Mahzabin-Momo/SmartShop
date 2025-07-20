
import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, Product> _cart = {};

  Map<int, Product> get cart => _cart;

  void addToCart(Product product) {
    _cart[product.id] = product;
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cart.remove(id);
    notifyListeners();
  }

  double get totalPrice => _cart.values.fold(0, (sum, p) => sum + p.price);

  int get itemCount => _cart.length;
}
