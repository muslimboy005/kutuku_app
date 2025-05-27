import 'package:cubit_lesson/models/product_model.dart';
import 'package:cubit_lesson/views/screens/my_cart_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 3;
  int selectedColorIndex = 0;
  final List<Color> colors = [
    Color(0xFF885248),
    Colors.black,
    Colors.cyan,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    )),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.title ?? '',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text('4.8',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(' (320 Review)'),
                        Spacer(),
                        Text('Available in stok',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Color',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: List.generate(colors.length, (index) {
                        return GestureDetector(
                          onTap: () =>
                              setState(() => selectedColorIndex = index),
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index],
                              border: selectedColorIndex == index
                                  ? Border.all(
                                      color: Colors.grey.shade800, width: 2)
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    Text('Description',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(
                      widget.product.description ?? '',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          widget.product.price.toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A3AFF),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(),
                                ));
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          label: Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Color(0xFF4A3AFF),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
