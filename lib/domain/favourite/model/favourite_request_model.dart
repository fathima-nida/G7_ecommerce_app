import 'package:equatable/equatable.dart';

class FavouriteRequestModel extends Equatable{
  final int pageNo;
  final int pageSize;
   final int irId;
  final String irName;
  final double irMrp;
  final int stock;
  final List<String> irImages; 
   

 const FavouriteRequestModel({
    required this.pageNo,
    required this.pageSize,
    required this.irId,
    required this.irName,
    required this.irMrp,
    required this.stock,
    required this.irImages
  });

  @override
  List<Object?> get props => [pageNo, pageSize];

  Map<String, dynamic> toMap() {
    return {
      'pageNo': pageNo,
      'pageSize': pageSize,
      'irId': irId,
      'irName': irName,
      'irMrp': irMrp,
      'stock': stock,
      'irImages': irImages, 
    };
  }
}


