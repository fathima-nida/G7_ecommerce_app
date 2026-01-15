import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/section_newarrival_item_model.dart';

abstract class SecNewArrivalState extends Equatable {
  const SecNewArrivalState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SecNewArrivalInitial extends SecNewArrivalState {}

/// While API is loading
class SecNewArrivalLoading extends SecNewArrivalState {}

/// Data loaded successfully
class SecNewArrivalSuccess extends SecNewArrivalState {
  final List<SectionItemDataModel> items;

  const SecNewArrivalSuccess(this.items);

  @override
  List<Object?> get props => [items];
}

/// API failed
class SecNewArrivalFailure extends SecNewArrivalState {
  final String message;

  const SecNewArrivalFailure(this.message);

  @override
  List<Object?> get props => [message];
}
