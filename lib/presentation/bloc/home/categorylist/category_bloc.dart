import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_item_model.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_req_model.dart';
import 'package:g7_comerce_app/domain/home/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<FetchCategoryEvent>(_onFetchCategory);
       
    
    }
  Future<void>_onFetchCategory(
    FetchCategoryEvent event,
    Emitter<CategoryState>emit,
  )async{

emit( CategoryLoading());
final result = await repository.fetchCategory(
  const CategoryListReqModel(),
);
result.fold((failure){emit(CategoryError(failure.message));},
 (response){
  log("error:${response.data}");
  emit(CategoryLoaded(response.data.categories));
  log("Loaded categories:${response.data.categories.length}");
 }
 );
  }
  

}
