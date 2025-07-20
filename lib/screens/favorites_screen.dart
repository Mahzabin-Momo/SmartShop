import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = Provider.of<ProductProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
              child: Text(
                'No favorites added yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (ctx, index) {
                final product = favoriteProducts[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      // Optionally toggle favorite status
                      Provider.of<ProductProvider>(context, listen: false)
                          .toggleFavorite(product.id);
                    },
                  ),
                );
              },
            ),
    );
  }
}

