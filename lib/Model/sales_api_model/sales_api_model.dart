import 'package:collection/collection.dart';

class SalesApiModel {
  String? orderId;
  String? time;
  String? date;
  String? orderAmount;
  String? productName;

  SalesApiModel({
    this.orderId,
    this.time,
    this.date,
    this.orderAmount,
    this.productName,
  });

  factory SalesApiModel.fromJson(Map<dynamic, dynamic> json) => SalesApiModel(
        orderId: json['order_id'] as String?,
        time: json['time'] as String?,
        date: json['date'] as String?,
        orderAmount: json['order_amount'] as String?,
        productName: json['product_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'time': time,
        'date': date,
        'order_amount': orderAmount,
        'product_name': productName,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SalesApiModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      orderId.hashCode ^
      time.hashCode ^
      date.hashCode ^
      orderAmount.hashCode ^
      productName.hashCode;
}
