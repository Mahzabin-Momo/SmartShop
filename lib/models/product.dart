class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  bool isFavorite; // ← ADD THIS

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    this.isFavorite = false, // ← default false
  });
}

