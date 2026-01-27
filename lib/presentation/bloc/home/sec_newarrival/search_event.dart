import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/search_req_model.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchProductsEvent extends SearchEvent {
  final SearchReqModel req;

  const SearchProductsEvent( this.req);

  @override
  List<Object?> get props => [req];
}


