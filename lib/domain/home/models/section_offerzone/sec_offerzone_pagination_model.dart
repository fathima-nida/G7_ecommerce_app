import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  final int page;
  final int pageSize;
  final int totalRecords;
  final int totalPages;

  const PaginationModel({
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      page: map['page']?.toInt() ?? 0,
      pageSize: map['pageSize']?.toInt() ?? 0,
      totalRecords: map['totalRecords']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
    );
  }

  factory PaginationModel.dummy() {
    return const PaginationModel(
      page: 1,
      pageSize: 10,
      totalRecords: 0,
      totalPages: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'totalRecords': totalRecords,
      'totalPages': totalPages,
    };
  }

  PaginationModel copyWith({
    int? page,
    int? pageSize,
    int? totalRecords,
    int? totalPages,
  }) {
    return PaginationModel(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalRecords: totalRecords ?? this.totalRecords,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, totalRecords, totalPages];
}
