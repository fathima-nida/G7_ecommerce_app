import 'package:equatable/equatable.dart';

abstract class SecNewArrivalEvent extends Equatable {
  const SecNewArrivalEvent();

  @override
  List<Object?> get props => [];
}

class FetchSecNewArrival extends SecNewArrivalEvent {
  final int page;
  const FetchSecNewArrival({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class RefreshSecNewArrival extends SecNewArrivalEvent {}

