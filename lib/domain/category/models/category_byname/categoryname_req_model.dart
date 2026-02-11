// import 'package:equatable/equatable.dart';

// class CategorySearchRequestModel extends Equatable {
//   final String name;

//   const CategorySearchRequestModel({required this.name});

//   @override
//   List<Object?> get props => [name];

//   // Convert to Map (optional, if needed for query or body)
//   Map<String, dynamic> toMap() {
//     return {"name": name};
//   }
// }
class CategorySearchRequestModel {
  final String name;

  CategorySearchRequestModel({required this.name});
}

