import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/search_resp_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final ProductRespModel data;

  const SearchSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
class SearchFailure extends SearchState {
  final String message;

  const SearchFailure(this.message);

  @override
  List<Object?> get props => [message];
}
