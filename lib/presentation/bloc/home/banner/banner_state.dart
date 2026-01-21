abstract class BannerState {
  const BannerState();
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {
  const BannerLoading();
}

class BannerLoaded extends BannerState {
  final List<String> banner1Images;
  final List<String> banner2Images;

  const BannerLoaded({
    required this.banner1Images,
    required this.banner2Images,
  });
}

class BannerError extends BannerState {
  final String message;
  const BannerError(this.message);
}
