import 'package:equatable/equatable.dart';

class CategoryListReqModel extends Equatable {
  final int pageNumber;
  final int pageSize;

  const CategoryListReqModel({
    this.pageNumber = 1,
    this.pageSize = 10,
  });

  @override
  List<Object?> get props => [pageNumber, pageSize];

  Map<String, dynamic> toMap() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
  }
}
