import 'package:cubit_lesson/models/cart_item.dart';
import 'package:cubit_lesson/views/widgets/cart_item_w.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      id: 1,
      name: "Bix Bag Limited Edition 229",
      color: "Berown",
      price: 67.00,
      quantity: 1,
      image: "assets/images/bag1.png",
    ),
    CartItem(
      id: 2,
      name: "Bix Bag Limited Edition 229",
      color: "Berown",
      price: 26.00,
      quantity: 1,
      image: "assets/images/headphones1.png",
    ),
    CartItem(
      id: 3,
      name: "Bix Bag Limited Edition 229",
      color: "Berown",
      price: 32.00,
      quantity: 1,
      image: "assets/images/headphones2.png",
    ),
    CartItem(
      id: 4,
      name: "Bix Bag 319",
      color: "Berown",
      price: 24.00,
      quantity: 1,
      image: "assets/images/bag2.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(
            item: cartItems[index],
            onQuantityChanged: (newQuantity) {
              setState(() {
                cartItems[index].quantity = newQuantity;
              });
            },
            onRemove: () {
              setState(() {
                cartItems.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
