class CartItem {
  final int id;
  final String name;
  final String color;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
