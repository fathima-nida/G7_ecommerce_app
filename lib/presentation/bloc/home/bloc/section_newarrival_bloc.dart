import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/sec_newarrival_rep_impl.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_state.dart';


class SecNewArrivalBloc extends Bloc<SecNewArrivalEvent, SecNewArrivalState> {
  final HomeRepository repository;

  SecNewArrivalBloc({required this.repository}) : super(SecNewArrivalInitial()) {
    on<FetchSecNewArrival>(_onFetch);
    on<RefreshSecNewArrival>(_onRefresh);
  }

  Future<void> _onFetch(FetchSecNewArrival event, Emitter<SecNewArrivalState> emit) async {
    emit(SecNewArrivalLoading());
    try {
      final data = await repository.fetchSecNewArrival(page: event.page);
      emit(SecNewArrivalLoaded(data));
    } catch (e) {
      emit(SecNewArrivalError(e.toString()));
    }
  }

  Future<void> _onRefresh(RefreshSecNewArrival event, Emitter<SecNewArrivalState> emit) async {
    try {
      final data = await repository.fetchSecNewArrival(page: 1);
      emit(SecNewArrivalLoaded(data));
    } catch (e) {
      emit(SecNewArrivalError(e.toString()));
    }
  }
}
