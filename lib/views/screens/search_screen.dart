import 'package:cubit_lesson/views/widgets/search_product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Search'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Last Search',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Clear All', style: TextStyle(color: Colors.deepPurple)),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  chip('Electronics'),
                  chip('Pants'),
                  chip('Three Second'),
                  chip('Long shirt'),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Popular Search',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: const [
                    SearchProduct(
                        'https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg',
                        'Lunilo Hils jacket',
                        '1.6k Search today',
                        'Hot',
                        Colors.redAccent),
                    SearchProduct(
                        'https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg',
                        'Denim Jeans',
                        '1k Search today',
                        'New',
                        Colors.orangeAccent),
                    SearchProduct(
                        'https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg',
                        'Redil Backpack',
                        '1.23k Search today',
                        'Popular',
                        Colors.greenAccent),
                    SearchProduct(
                        'https://www.althesys.com/wp-content/uploads/2024/06/fashion-clothing-hangers-show_1153-5492.jpg',
                        'JBL Speakers',
                        '1.1k Search today',
                        'New',
                        Colors.orangeAccent),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget chip(String text) {
  return Chip(
    label: Text(
      text,
      style: TextStyle(color: Colors.black),
    ),
    onDeleted: () {},
    backgroundColor: Colors.grey.shade200,
    deleteIcon: const Icon(Icons.close, size: 18),
  );
}
