import 'package:cubit_lesson/view_model/product_screen.dart/product_state.dart';
import 'package:cubit_lesson/view_model/product_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitProduct extends Cubit<CubitProductState> {
  CubitProduct()
      : super(CubitProductState(products: [], isLoading: false, error: ''));

  void getProducts() async {
    try {
      final products = await ProductController.getProducts();
      emit(CubitProductState(products: products, isLoading: false, error: ''));
    } catch (e) {
      emit(CubitProductState(
          products: [], isLoading: false, error: e.toString()));
    }
  }
}
