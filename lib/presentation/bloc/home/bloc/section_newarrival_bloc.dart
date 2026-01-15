import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival_req_model.dart';
import 'package:g7_comerce_app/domain/home/repository/sec_newarrival_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_state.dart';

class SecNewarrivalBloc
    extends Bloc<SecNewArrivalEvent, SecNewArrivalState> {
  final SecNewarrivalRepository repository;

  SecNewarrivalBloc(this.repository)
      : super(SecNewArrivalInitial()) {
    on<FetchNewArrivalEvent>(_onSecNewArrival);
  }

  Future<void> _onSecNewArrival(
    FetchNewArrivalEvent event,
    Emitter<SecNewArrivalState> emit,
  ) async {
    emit(SecNewArrivalLoading());

    final result = await repository.fetchSecNewarrival(
      const SectionWiseItemsReqModel(
        sectionName: 'newarrival',
      ),
    );

    result.fold(
      (failure) {
        emit(SecNewArrivalFailure(failure.message));
      },
      (response) {
        log('NewArrival items count: ${response.sections.length}');
        emit(SecNewArrivalSuccess(response.sections));
      },
    );
  }
}
