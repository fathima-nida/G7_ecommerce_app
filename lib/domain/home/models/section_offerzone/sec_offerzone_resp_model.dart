import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/sec_newarrivalpagination_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/section_newarrival_item_model.dart';

class SectionOfferzoneItemsRespModel extends Equatable {
  final PaginationModel pagination;
  final List<SectionItemDataModel> sections;

  const SectionOfferzoneItemsRespModel({
    required this.pagination,
    required this.sections,
  });

  factory SectionOfferzoneItemsRespModel.fromMap(Map<String, dynamic> map) {
    return SectionOfferzoneItemsRespModel(
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

  factory SectionOfferzoneItemsRespModel.dummy() {
    return SectionOfferzoneItemsRespModel(
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

  SectionOfferzoneItemsRespModel copyWith({
    PaginationModel? pagination,
    List<SectionItemDataModel>? sections,
  }) {
    return SectionOfferzoneItemsRespModel(
      pagination: pagination ?? this.pagination,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [pagination, sections];
}
