import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/pagination_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_item_model.dart';

class SectionWiseItemsRespModel extends Equatable {
  final PaginationModel pagination;
  final List<SectionItemDataModel> sections;

  const SectionWiseItemsRespModel({
    required this.pagination,
    required this.sections,
  });

  factory SectionWiseItemsRespModel.fromMap(Map<String, dynamic> map) {
    return SectionWiseItemsRespModel(
      pagination: PaginationModel.fromMap(
        map['pagination'] as Map<String, dynamic>? ?? {},
      ),
      sections: List<SectionItemDataModel>.from(
        (map['sections'] ?? []).map(
          (x) => SectionItemDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory SectionWiseItemsRespModel.dummy() {
    return SectionWiseItemsRespModel(
      pagination: PaginationModel.dummy(),
      sections: const [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pagination': pagination.toMap(),
      'sections': sections.map((x) => x.toMap()).toList(),
    };
  }

  SectionWiseItemsRespModel copyWith({
    PaginationModel? pagination,
    List<SectionItemDataModel>? sections,
  }) {
    return SectionWiseItemsRespModel(
      pagination: pagination ?? this.pagination,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [pagination, sections];
}
