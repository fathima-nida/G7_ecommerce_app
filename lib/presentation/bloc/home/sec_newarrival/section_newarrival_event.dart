import 'package:equatable/equatable.dart';

abstract class SecNewArrivalEvent extends Equatable {
  const SecNewArrivalEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when New Arrival section loads
class FetchNewArrivalEvent extends SecNewArrivalEvent {
  const FetchNewArrivalEvent();
}

/// Optional: retry on failure
class RetryFetchNewArrivalEvent extends SecNewArrivalEvent {
  const RetryFetchNewArrivalEvent();
}
