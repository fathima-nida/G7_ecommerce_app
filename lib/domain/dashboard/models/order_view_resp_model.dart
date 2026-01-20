import 'package:equatable/equatable.dart';

class OrderViewRespModel extends Equatable {
  final int orderNo;
  final double totalAmount;
  final int customerId;
  final String customerName;
  final int salesmanId;
  final String salesmanName;
  final int routeId;
  final String routeName;
  final int areaId;
  final String areaName;
  final DateTime date;
  final int totalQty;
  final String status;
  final List<CheckoutStatusModel> statusList;
  final List<CheckoutCartItemModel> cartItems;

  const OrderViewRespModel({
    required this.orderNo,
    required this.totalAmount,
    required this.customerId,
    required this.customerName,
    required this.salesmanId,
    required this.salesmanName,
    required this.routeId,
    required this.routeName,
    required this.areaId,
    required this.areaName,
    required this.date,
    required this.totalQty,
    required this.status,
    required this.statusList,
    required this.cartItems,
  });

  @override
  List<Object?> get props => [
        orderNo,
        totalAmount,
        customerId,
        customerName,
        salesmanId,
        salesmanName,
        routeId,
        routeName,
        areaId,
        areaName,
        date,
        totalQty,
        status,
        statusList,
        cartItems,
      ];

  factory OrderViewRespModel.fromMap(Map<String, dynamic> map) {
    return OrderViewRespModel(
      orderNo: int.tryParse(map['orderNo']?.toString() ?? "0") ?? 0,
      totalAmount:
          double.tryParse(map['totalAmount']?.toString() ?? "0") ?? 0.0,
      customerId: int.tryParse(map['customerId']?.toString() ?? "0") ?? 0,
      customerName: map['customerName']?.toString() ?? "",
      salesmanId: int.tryParse(map['salesmanId']?.toString() ?? "0") ?? 0,
      salesmanName: map['salesmanName']?.toString() ?? "",
      routeId: int.tryParse(map['routeId']?.toString() ?? "0") ?? 0,
      routeName: map['routeName']?.toString() ?? "",
      areaId: int.tryParse(map['areaId']?.toString() ?? "0") ?? 0,
      areaName: map['areaName']?.toString() ?? "",
      date: DateTime.tryParse(map['date']?.toString() ?? "") ?? DateTime.now(),
      totalQty: int.tryParse(map['totalQty']?.toString() ?? "0") ?? 0,
      status: map['status']?.toString() ?? "",
      statusList: (map['statusList'] as List? ?? [])
          .map((e) => CheckoutStatusModel.fromMap(e as Map<String, dynamic>))
          .toList(),
      cartItems: (map['cartItems'] as List? ?? [])
          .map((e) => CheckoutCartItemModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "orderNo": orderNo,
      "totalAmount": totalAmount,
      "customerId": customerId,
      "customerName": customerName,
      "salesmanId": salesmanId,
      "salesmanName": salesmanName,
      "routeId": routeId,
      "routeName": routeName,
      "areaId": areaId,
      "areaName": areaName,
      "date": date.toIso8601String(),
      "totalQty": totalQty,
      "status": status,
      "statusList": statusList.map((e) => e.toMap()).toList(),
      "cartItems": cartItems.map((e) => e.toMap()).toList(),
    };
  }

  static OrderViewRespModel dummy() {
    return OrderViewRespModel(
      orderNo: 38,
      totalAmount: 6594,
      customerId: 3937,
      customerName: "MOBILE WORLD PARAPPANANGADI",
      salesmanId: 3258,
      salesmanName: "68-UNAIF",
      routeId: -1,
      routeName: "",
      areaId: 21,
      areaName: "CHEMMAD",
      date: DateTime.now(),
      totalQty: 16,
      status: "Pending",
      statusList: [CheckoutStatusModel.dummy()],
      cartItems: [
        CheckoutCartItemModel.dummy(),
      ],
    );
  }
}

class CheckoutStatusModel extends Equatable {
  final String status;
  final DateTime date;

  const CheckoutStatusModel({
    required this.status,
    required this.date,
  });

  @override
  List<Object?> get props => [status, date];

  factory CheckoutStatusModel.fromMap(Map<String, dynamic> map) {
    return CheckoutStatusModel(
      status: map['status']?.toString() ?? '',
      date: DateTime.tryParse(map['date']?.toString() ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "status": status,
      "date": date.toIso8601String(),
    };
  }

  static CheckoutStatusModel dummy() {
    return CheckoutStatusModel(
      status: "Pending",
      date: DateTime.now(),
    );
  }
}

class CheckoutCartItemModel extends Equatable {
  final int itemId;
  final String itemName;
  final int qty;
  final double price;
  final String status;
  final String remarks;
  final String attachment;
  final List<String> images;

  const CheckoutCartItemModel({
    required this.itemId,
    required this.itemName,
    required this.qty,
    required this.price,
    required this.status,
    required this.remarks,
    required this.attachment,
    required this.images,
  });

  @override
  List<Object?> get props => [
        itemId,
        itemName,
        qty,
        price,
        status,
        remarks,
        attachment,
        images,
      ];

  factory CheckoutCartItemModel.fromMap(Map<String, dynamic> map) {
    return CheckoutCartItemModel(
      itemId: int.tryParse(map['itemId']?.toString() ?? "0") ?? 0,
      itemName: map['itemName']?.toString() ?? '',
      qty: int.tryParse(map['qty']?.toString() ?? "0") ?? 0,
      price: double.tryParse(map['price']?.toString() ?? "0") ?? 0.0,
      status: map['status']?.toString() ?? '',
      remarks: map['remarks']?.toString() ?? '',
      attachment: map['attachment']?.toString() ?? '',
      images: (map['images'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "itemId": itemId,
      "itemName": itemName,
      "qty": qty,
      "price": price,
      "status": status,
      "remarks": remarks,
      "attachment": attachment,
      "images": images,
    };
  }

  static CheckoutCartItemModel dummy() {
    return CheckoutCartItemModel(
      itemId: 12203,
      itemName: "F20 MAGSAFE PRINT SILICON CASE",
      qty: 3,
      price: 237,
      status: "Pending",
      remarks: "",
      attachment: "",
      images: [
        "http://3.109.147.140:3045/uploads/item/sample.jpeg",
      ],
    );
  }
}
