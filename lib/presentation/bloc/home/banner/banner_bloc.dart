import 'package:bloc/bloc.dart';
import 'package:g7_comerce_app/domain/home/repository/banner_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository repository;

  BannerBloc(this.repository) : super(BannerInitial()) {
    on<FetchBannerEvent>(_onFetchBanner);
  }

  Future<void> _onFetchBanner(
    FetchBannerEvent event,
    Emitter<BannerState> emit,
  ) async {
    emit(const BannerLoading());

    final result = await repository.fetchbanner();

    result.fold(
      (failure) {
        emit(BannerError(failure.message));
      },
      (response) {
        final banner1Images = response.data.banner1
            .expand((b) => b.images)
            .toList();

        final banner2Images = response.data.banner2
            .expand((b) => b.images)
            .toList();

        if (banner1Images.isEmpty && banner2Images.isEmpty) {
          emit(const BannerError("No banner images found"));
        } else {
          emit(
            BannerLoaded(
              banner1Images: banner1Images,
              banner2Images: banner2Images,
            ),
          );
        }
      },
    );
  }
}
