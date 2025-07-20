import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
  
  ];

  // Store favorite product IDs
  final Set<int> _favoriteProductIds = {};

  // Getter to return all products
  List<Product> get products {
    return [..._products];
  }

  // Getter to return favorite products
  List<Product> get favorites {
    return _products.where((prod) => _favoriteProductIds.contains(prod.id)).toList();
  }

  // Method to add a product
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  // Method to remove a product by id
  void removeProduct(int id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  // Method to toggle favorite status
  void toggleFavorite(int productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
  }

  
}

