import 'package:equatable/equatable.dart';

class SectionOfferzoneReqModel extends Equatable {
  final String sectionName;
  final int pageNumber;
  final int pageSize;
  const SectionOfferzoneReqModel({
    required this.sectionName,
    this.pageNumber=1,
    this.pageSize=10,
  });
  Map<String, dynamic> toQueryMap() {
    return {
      "pageNumber": pageNumber,
      "pageSize": pageSize,
    };
  }

  @override
  List<Object?> get props => [sectionName, pageNumber, pageSize];
 
}