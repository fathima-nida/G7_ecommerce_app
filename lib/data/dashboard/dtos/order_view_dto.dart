import 'package:g7_comerce_app/domain/dashboard/models/order_view_resp_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_view_dto.g.dart';


@JsonSerializable()
class CheckoutListRespDto {
  @JsonKey(name: "data")
  final List<CheckoutListDataDto>? data;

  const CheckoutListRespDto({
    this.data,
  });

  factory CheckoutListRespDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutListRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutListRespDtoToJson(this);

  /// ✅ DTO -> Model (Returns List because wrapper model is common)
  List<OrderViewRespModel> toModel() {
    return (data ?? []).map((e) => e.toModel()).toList();
  }
}

@JsonSerializable()
class CheckoutListDataDto {
  @JsonKey(name: "orderNo")
  final dynamic orderNo;

  @JsonKey(name: "totalAmount")
  final dynamic totalAmount;

  @JsonKey(name: "customerId")
  final dynamic customerId;

  @JsonKey(name: "customerName")
  final dynamic customerName;

  @JsonKey(name: "salesmanId")
  final dynamic salesmanId;

  @JsonKey(name: "salesmanName")
  final dynamic salesmanName;

  @JsonKey(name: "routeId")
  final dynamic routeId;

  @JsonKey(name: "routeName")
  final dynamic routeName;

  @JsonKey(name: "areaId")
  final dynamic areaId;

  @JsonKey(name: "areaName")
  final dynamic areaName;

  @JsonKey(name: "date")
  final dynamic date;

  @JsonKey(name: "totalQty")
  final dynamic totalQty;

  @JsonKey(name: "status")
  final dynamic status;

  @JsonKey(name: "statusList")
  final List<CheckoutStatusDto>? statusList;

  @JsonKey(name: "cartItems")
  final List<CheckoutCartItemDto>? cartItems;

  const CheckoutListDataDto({
    this.orderNo,
    this.totalAmount,
    this.customerId,
    this.customerName,
    this.salesmanId,
    this.salesmanName,
    this.routeId,
    this.routeName,
    this.areaId,
    this.areaName,
    this.date,
    this.totalQty,
    this.status,
    this.statusList,
    this.cartItems,
  });

  factory CheckoutListDataDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutListDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutListDataDtoToJson(this);

  /// ✅ DTO -> Model
  OrderViewRespModel toModel() {
    return OrderViewRespModel(
      orderNo: int.tryParse(orderNo?.toString() ?? "0") ?? 0,
      totalAmount:
          double.tryParse(totalAmount?.toString() ?? "0") ?? 0.0,
      customerId: int.tryParse(customerId?.toString() ?? "0") ?? 0,
      customerName: customerName?.toString() ?? '',
      salesmanId: int.tryParse(salesmanId?.toString() ?? "0") ?? 0,
      salesmanName: salesmanName?.toString() ?? '',
      routeId: int.tryParse(routeId?.toString() ?? "0") ?? 0,
      routeName: routeName?.toString() ?? '',
      areaId: int.tryParse(areaId?.toString() ?? "0") ?? 0,
      areaName: areaName?.toString() ?? '',
      date: date != null
          ? DateTime.tryParse(date.toString()) ?? DateTime.now()
          : DateTime.now(),
      totalQty: int.tryParse(totalQty?.toString() ?? "0") ?? 0,
      status: status?.toString() ?? '',
      statusList: (statusList ?? []).map((e) => e.toModel()).toList(),
      cartItems: (cartItems ?? []).map((e) => e.toModel()).toList(),
    );
  }
}

@JsonSerializable()
class CheckoutStatusDto {
  @JsonKey(name: "status")
  final dynamic status;

  @JsonKey(name: "date")
  final dynamic date;

  const CheckoutStatusDto({
    this.status,
    this.date,
  });

  factory CheckoutStatusDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutStatusDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutStatusDtoToJson(this);

  /// ✅ DTO -> Model
  CheckoutStatusModel toModel() {
    return CheckoutStatusModel(
      status: status?.toString() ?? '',
      date: date != null
          ? DateTime.tryParse(date.toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

@JsonSerializable()
class CheckoutCartItemDto {
  @JsonKey(name: "itemId")
  final dynamic itemId;

  @JsonKey(name: "itemName")
  final dynamic itemName;

  @JsonKey(name: "qty")
  final dynamic qty;

  @JsonKey(name: "price")
  final dynamic price;

  @JsonKey(name: "status")
  final dynamic status;

  @JsonKey(name: "remarks")
  final dynamic remarks;

  @JsonKey(name: "attachment")
  final dynamic attachment;

  @JsonKey(name: "images")
  final List<dynamic>? images;

  const CheckoutCartItemDto({
    this.itemId,
    this.itemName,
    this.qty,
    this.price,
    this.status,
    this.remarks,
    this.attachment,
    this.images,
  });

  factory CheckoutCartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCartItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCartItemDtoToJson(this);

  /// ✅ DTO -> Model
  CheckoutCartItemModel toModel() {
    return CheckoutCartItemModel(
      itemId: int.tryParse(itemId?.toString() ?? "0") ?? 0,
      itemName: itemName?.toString() ?? '',
      qty: int.tryParse(qty?.toString() ?? "0") ?? 0,
      price: double.tryParse(price?.toString() ?? "0") ?? 0.0,
      status: status?.toString() ?? '',
      remarks: remarks?.toString() ?? '',
      attachment: attachment?.toString() ?? '',
      images: (images ?? []).map((e) => e.toString()).toList(),
    );
  }
}
