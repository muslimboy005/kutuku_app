import 'package:cubit_lesson/models/product_model.dart';

class CubitProductState {
  final List<Product> products;
  final bool isLoading;
  final String error;

  CubitProductState({
    required this.products,
    required this.isLoading,
    required this.error,
  });
}