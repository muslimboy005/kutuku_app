class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;
  final String? category;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}
