import 'package:equatable/equatable.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();
  @override
  List<Object?>get props =>[];
}
class FetchBannerEvent extends BannerEvent{
  const FetchBannerEvent();
}

