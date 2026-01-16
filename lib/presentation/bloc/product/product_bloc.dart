// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../data/services/product_api.dart';
// import 'product_event.dart';
// import 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductInitial()) {
//     on<LoadProductEvent>((event, emit) async {
//       emit(ProductLoading());
//       try {
//         final product = await ProductApi.getProduct(event.id);
//         emit(ProductLoaded(product));
//       } catch (e) {
//         emit(ProductError("Failed to load product"));
//       }
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/domain/cart/repositories/product_repo.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repo;

  ProductBloc(this.repo) : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await repo.getProduct(event.id);
        emit(ProductLoaded(product));
      } catch (_) {
        emit(ProductError("Failed to load product"));
      }
    });
  }
}

