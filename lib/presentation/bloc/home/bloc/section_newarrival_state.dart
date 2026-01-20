
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival_resp_model.dart';

abstract class SecNewArrivalState extends Equatable {
  const SecNewArrivalState();

  @override
  List<Object?> get props => [];
}

class SecNewArrivalInitial extends SecNewArrivalState {}

class SecNewArrivalLoading extends SecNewArrivalState {}

class SecNewArrivalLoaded extends SecNewArrivalState {
  final SectionWiseItemsRespModel data;
  const SecNewArrivalLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class SecNewArrivalError extends SecNewArrivalState {
  final String message;
  const SecNewArrivalError(this.message);

  @override
  List<Object?> get props => [message];
}
