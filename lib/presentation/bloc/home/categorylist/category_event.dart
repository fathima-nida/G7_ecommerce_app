part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
  
}
class FetchCategoryEvent extends CategoryEvent{
  const FetchCategoryEvent();
}
class SearchCategoryEvent extends CategoryEvent {
  final String name;
  const SearchCategoryEvent(this.name);
}

