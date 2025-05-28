import 'dart:convert';

import 'package:cubit_lesson/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  static Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedData = jsonDecode(response.body);
      List<Product> products = [];
      for (var element in decodedData) {
        print("element: $element");
        print("-----------------");
        try {
          products.add(Product.fromJson(element));
        } catch (e, stackTrace) {
          print("$e, $stackTrace");
        }
      }
      return products;
    } else {
      print('xato');
      throw Exception('Failed to load products');
    }
  }
}
