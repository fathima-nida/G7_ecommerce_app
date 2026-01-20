import 'package:equatable/equatable.dart';

class SectionWiseItemsReqModel extends Equatable {
  final String sectionName;
  final int pageNumber;
  final int pageSize;

  const SectionWiseItemsReqModel({
    required this.sectionName,
    this.pageNumber = 1,
    this.pageSize = 10,
  });

  /// Query parameters
  Map<String, dynamic> toQueryMap() {
    return {
      "sectionName": sectionName,
      "pageNumber": pageNumber,
      "pageSize": pageSize,
    };
  }

  @override
  List<Object?> get props => [sectionName, pageNumber, pageSize];
}
