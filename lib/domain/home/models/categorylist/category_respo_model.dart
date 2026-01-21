import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_listdata_model.dart';


class CategoryListResponseModel extends Equatable {
  final CommonResponseModel common;
  final CategoryListDataModel data;

  const CategoryListResponseModel({
    required this.common,
    required this.data,
  });

  factory CategoryListResponseModel.fromMap(Map<String, dynamic> map) {
    return CategoryListResponseModel(
      common: CommonResponseModel.fromMap(map),
      data: CategoryListDataModel.fromMap(
        map['data'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  factory CategoryListResponseModel.dummy() {
    return CategoryListResponseModel(
      common: const CommonResponseModel(
        status: false,
        statusCode: 0,
        message: '',
      ),
      data: CategoryListDataModel.dummy(),
    );
  }

  @override
  List<Object?> get props => [common, data];
}
