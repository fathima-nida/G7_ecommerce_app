import 'package:equatable/equatable.dart';

class FavouriteRequestModel extends Equatable{
  final int pageNo;
  final int pageSize;

 const FavouriteRequestModel({
    required this.pageNo,
    required this.pageSize,
  });

  @override
  List<Object?> get props => [pageNo, pageSize];

  Map<String, dynamic> toMap() {
    return {
      'pageNo': pageNo,
      'pageSize': pageSize,
    };
  }
}


