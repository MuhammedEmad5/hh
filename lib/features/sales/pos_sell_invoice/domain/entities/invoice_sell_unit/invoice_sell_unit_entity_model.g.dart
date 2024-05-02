// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_sell_unit_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceSellUnitEntity _$InvoiceSellUnitEntityFromJson(
        Map<String, dynamic> json) =>
    InvoiceSellUnitEntity(
      invoiceNo: json['invoiceNo'] as int? ?? 0,
      buildingNo: json['buildingNo'] as num? ?? 0,
      orderNo: json['orderNo'] as int? ?? 0,
      itemNo: json['itemNo'] as num? ?? 0,
      unitNo: json['unitNo'] as int? ?? 0,
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      quantity: json['quantity'] as num? ?? 0,
      price: json['price'] as num? ?? 0,
      discount: json['discount'] as num? ?? 0,
      discountPercent: json['discountPercent'] as num? ?? 0,
      discountTotal: json['discountTotal'] as num? ?? 0,
      total: json['total'] as num? ?? 0,
      taxRate1_Percentage: json['taxRate1_Percentage'] as num? ?? 0,
      taxRate1_Total: json['taxRate1_Total'] as num? ?? 0,
      totalPlusTax: json['totalPlusTax'] as num? ?? 0,
      barCode: json['barCode'] as String? ?? '0',
    );

Map<String, dynamic> _$InvoiceSellUnitEntityToJson(
        InvoiceSellUnitEntity instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'buildingNo': instance.buildingNo,
      'orderNo': instance.orderNo,
      'itemNo': instance.itemNo,
      'unitNo': instance.unitNo,
      'aName': instance.aName,
      'eName': instance.eName,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount': instance.discount,
      'discountPercent': instance.discountPercent,
      'discountTotal': instance.discountTotal,
      'totalPlusTax': instance.totalPlusTax,
      'taxRate1_Total': instance.taxRate1_Total,
      'taxRate1_Percentage': instance.taxRate1_Percentage,
      'total': instance.total,
      'barCode': instance.barCode,
    };
