import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/domain/home/repository/search_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<SearchProductsEvent>(_onSearchProducts);
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    final result = await repository.searchProducts(event.req);

    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (data) => emit(SearchSuccess(data)),
    );
  }
}
