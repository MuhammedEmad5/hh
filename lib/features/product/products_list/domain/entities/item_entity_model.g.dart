// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) => ItemEntity(
      itemNo: json['itemNo'] as num,
      aName: json['aName'] as String? ?? "منتج جديد",
      eName: json['eName'] as String? ?? "New Product",
      barCode: json['barCode'] as String,
      userNumber: json['userNumber'] as String,
      unitNo_defaultSell: (json['unitNo_defaultSell'] as num?)?.toInt() ?? 1,
      itemClassificationTreeNo: json['itemClassificationTreeNo'] as num? ?? 1,
      taxPurchasePercent: json['taxPurchasePercent'] as num? ?? 0,
      tax_isUseSeparateFieldsForTax: json['tax_isUseSeparateFieldsForTax'] ?? 0,
      buyPrice: json['buyPrice'] as num? ?? 0,
      taxPurchaseAmount: json['taxPurchaseAmount'] as num? ?? 0,
      taxPercent: json['taxPercent'] as num? ?? 0,
      sellPrice: json['sellPrice'] as num? ?? 0,
      sellPrice2: json['sellPrice2'] as num? ?? 0,
      sellPrice3: json['sellPrice3'] as num? ?? 0,
      sellPrice4: json['sellPrice4'] as num? ?? 0,
      discount: json['discount'] as num? ?? 0,
      discount_Percentage: json['discount_Percentage'] as num? ?? 0,
    );

Map<String, dynamic> _$ItemEntityToJson(ItemEntity instance) =>
    <String, dynamic>{
      'itemNo': instance.itemNo,
      'aName': instance.aName,
      'eName': instance.eName,
      'barCode': instance.barCode,
      'unitNo_defaultSell': instance.unitNo_defaultSell,
      'itemClassificationTreeNo': instance.itemClassificationTreeNo,
      'taxPurchasePercent': instance.taxPurchasePercent,
      'tax_isUseSeparateFieldsForTax': instance.tax_isUseSeparateFieldsForTax,
      'buyPrice': instance.buyPrice,
      'taxPurchaseAmount': instance.taxPurchaseAmount,
      'taxPercent': instance.taxPercent,
      'sellPrice': instance.sellPrice,
      'sellPrice2': instance.sellPrice2,
      'sellPrice3': instance.sellPrice3,
      'sellPrice4': instance.sellPrice4,
      'discount': instance.discount,
      'discount_Percentage': instance.discount_Percentage,
      'userNumber': instance.userNumber,
    };
