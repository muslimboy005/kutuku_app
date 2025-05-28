import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_lesson/view_model/product_screen.dart/product_state.dart';
import 'package:cubit_lesson/view_model/product_screen.dart/product_event.dart';
import 'package:cubit_lesson/view_model/product_controller.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(ProductState(
            products: [], isLoading: false, error: '')) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event,
      Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));

    try {
      final products =
          await ProductController.getProducts();
      emit(state.copyWith(
          products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
