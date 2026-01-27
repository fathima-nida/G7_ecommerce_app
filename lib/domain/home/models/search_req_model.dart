import 'package:flutter/widgets.dart';

class SearchReqModel {
  final String name;
  final int? categoryId;


  SearchReqModel({
    required this.name,
    this.categoryId,
  });

  Map<String, dynamic>toMap(){
    final Map<String, dynamic> data = {};

    if (name != null && name!.isNotEmpty){
      data['name'] = name;
    }
    if (categoryId != null){
      data['categoryId'] = categoryId;
    }
    return data;
  }

  SearchReqModel copyWith({
    String? name,
    int? categoryId,
  }) {
    return SearchReqModel(
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      );
  }

  @override
  List<Object?> get props => [name, categoryId];
}

