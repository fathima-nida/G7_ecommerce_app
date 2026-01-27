// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_view_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutListRespDto _$CheckoutListRespDtoFromJson(Map<String, dynamic> json) =>
    CheckoutListRespDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CheckoutListDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutListRespDtoToJson(
  CheckoutListRespDto instance,
) => <String, dynamic>{'data': instance.data};

CheckoutListDataDto _$CheckoutListDataDtoFromJson(Map<String, dynamic> json) =>
    CheckoutListDataDto(
      orderNo: json['orderNo'],
      totalAmount: json['totalAmount'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      salesmanId: json['salesmanId'],
      salesmanName: json['salesmanName'],
      routeId: json['routeId'],
      routeName: json['routeName'],
      areaId: json['areaId'],
      areaName: json['areaName'],
      date: json['date'],
      totalQty: json['totalQty'],
      status: json['status'],
      statusList: (json['statusList'] as List<dynamic>?)
          ?.map((e) => CheckoutStatusDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CheckoutCartItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutListDataDtoToJson(
  CheckoutListDataDto instance,
) => <String, dynamic>{
  'orderNo': instance.orderNo,
  'totalAmount': instance.totalAmount,
  'customerId': instance.customerId,
  'customerName': instance.customerName,
  'salesmanId': instance.salesmanId,
  'salesmanName': instance.salesmanName,
  'routeId': instance.routeId,
  'routeName': instance.routeName,
  'areaId': instance.areaId,
  'areaName': instance.areaName,
  'date': instance.date,
  'totalQty': instance.totalQty,
  'status': instance.status,
  'statusList': instance.statusList,
  'cartItems': instance.cartItems,
};

CheckoutStatusDto _$CheckoutStatusDtoFromJson(Map<String, dynamic> json) =>
    CheckoutStatusDto(status: json['status'], date: json['date']);

Map<String, dynamic> _$CheckoutStatusDtoToJson(CheckoutStatusDto instance) =>
    <String, dynamic>{'status': instance.status, 'date': instance.date};

CheckoutCartItemDto _$CheckoutCartItemDtoFromJson(Map<String, dynamic> json) =>
    CheckoutCartItemDto(
      itemId: json['itemId'],
      itemName: json['itemName'],
      qty: json['qty'],
      price: json['price'],
      status: json['status'],
      remarks: json['remarks'],
      attachment: json['attachment'],
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$CheckoutCartItemDtoToJson(
  CheckoutCartItemDto instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'itemName': instance.itemName,
  'qty': instance.qty,
  'price': instance.price,
  'status': instance.status,
  'remarks': instance.remarks,
  'attachment': instance.attachment,
  'images': instance.images,
};
