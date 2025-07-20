import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView(
        children: cartProvider.cart.values.map((product) {
          return ListTile(
            title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => cartProvider.removeFromCart(product.id),
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}