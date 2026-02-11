import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categorysearch_response_model.dart';
import 'package:g7_comerce_app/domain/category/repositories/category_repo.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'category_event.dart';
import 'category_state.dart'; // ✅ Make sure this import exists

class CategorySearchBloc
    extends Bloc<CategorySearchEvent, CategorySearchState> {
  final CategoriesRepo repository;

  CategorySearchBloc(this.repository)
      : super(CategorySearchInitial()) {
    on<FetchCategoriesByName>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
      FetchCategoriesByName event, Emitter<CategorySearchState> emit) async {
    emit(CategorySearchLoading());

    final Either<AppFailure, CategorySearchResponseModel> result =
        await repository.fetchCategories(event.request);

    result.fold(
      (failure) => emit(CategorySearchError(failure.message)),
      (response) => emit(CategorySearchLoaded(response)),
    );
  }
}
