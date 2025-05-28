import 'package:cubit_lesson/models/product_model.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String error;

  ProductState({
    required this.products,
    required this.isLoading,
    required this.error,
  });

  // State'ni nusxalab o‘zgartirish uchun copyWith funksiyasi
  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
