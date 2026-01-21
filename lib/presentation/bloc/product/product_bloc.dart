import 'package:bloc/bloc.dart';
import 'package:g7_comerce_app/domain/category/models/product_request_model.dart';
import 'package:g7_comerce_app/domain/category/repositories/product_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_event.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_state.dart';
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository repo;

  ProductDetailsBloc(this.repo) : super(ProductDetailsInitial()) {
    on<LoadProductDetailsEvent>(_onLoadProductDetails);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());
    final req = ProductRequestModel(productId: event.productId,);

final result = await repo.getProductDetails(req);


    result.fold(
      (failure) => emit(ProductDetailsFailure(failure.message)),
      (success) => emit(ProductDetailsSuccess(success)),
    );
  }
}
