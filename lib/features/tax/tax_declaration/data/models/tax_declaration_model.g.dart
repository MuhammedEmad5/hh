// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_declaration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxDeclaration _$TaxDeclarationFromJson(Map<String, dynamic> json) =>
    TaxDeclaration(
      buildingNo: (json['buildingNo'] as num?)?.toInt(),
      VATTypeNo: (json['VATTypeNo'] as num).toInt(),
      VATBillType: (json['VATBillType'] as num).toInt(),
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      PurchaseAmount: json['PurchaseAmount'] as num,
      PurchaseAmount_Tax_Total: json['PurchaseAmount_Tax_Total'] as num,
      SalesAmount: json['SalesAmount'] as num,
      SalesAmount_Tax_Total: json['SalesAmount_Tax_Total'] as num,
      countBills: (json['countBills'] as num).toInt(),
    );

Map<String, dynamic> _$TaxDeclarationToJson(TaxDeclaration instance) =>
    <String, dynamic>{
      'buildingNo': instance.buildingNo,
      'VATTypeNo': instance.VATTypeNo,
      'VATBillType': instance.VATBillType,
      'aName': instance.aName,
      'eName': instance.eName,
      'PurchaseAmount': instance.PurchaseAmount,
      'PurchaseAmount_Tax_Total': instance.PurchaseAmount_Tax_Total,
      'SalesAmount': instance.SalesAmount,
      'SalesAmount_Tax_Total': instance.SalesAmount_Tax_Total,
      'countBills': instance.countBills,
    };
