import 'package:equatable/equatable.dart';
import 'banner_item_model.dart';

class BannerDataModel extends Equatable {
  final List<BannerItemModel> banner1;
  final List<BannerItemModel> banner2;

  const BannerDataModel({
    required this.banner1,
    required this.banner2,
  });

  factory BannerDataModel.fromMap(Map<String, dynamic> map) {
    return BannerDataModel(
      banner1: (map['banner1'] as List<dynamic>? ?? [])
          .map((e) => BannerItemModel.fromMap(e))
          .toList(),
      banner2: (map['banner2'] as List<dynamic>? ?? [])
          .map((e) => BannerItemModel.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'banner1': banner1.map((e) => e.toMap()).toList(),
      'banner2': banner2.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [banner1, banner2];
}
