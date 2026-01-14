import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/product_api.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await ProductApi.getProduct(event.id);
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductError("Failed to load product"));
      }
    });
  }
}
