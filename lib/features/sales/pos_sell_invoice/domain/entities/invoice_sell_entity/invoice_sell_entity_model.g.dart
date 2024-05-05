// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_sell_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceSellEntity _$InvoiceSellEntityFromJson(Map<String, dynamic> json) =>
    InvoiceSellEntity(
      clientVendorNo: json['clientVendorNo'] as num?,
      invoiceNo: json['invoiceNo'] as int,
      userNumber: json['userNumber'] as String,
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      subNetTotal: json['subNetTotal'] as num? ?? 0,
      subNetTotalPlusTax: json['subNetTotalPlusTax'] as num? ?? 0,
      subTotalDiscount: json['subTotalDiscount'] as num? ?? 0,
      dateG: json['dateG'] as String?,
      invoiceVATID: json['invoiceVATID'] as String?,
      telephone: json['telephone'] as String?,
      buildingNo: json['buildingNo'] as num? ?? 1,
      amountLeft: json['amountLeft'] as num? ?? 0,
      amountPayed: json['amountPayed'] as num? ?? 0,
      paperBillNum: json['paperBillNum'] as String?,
      StoreNo: json['StoreNo'] as num? ?? 1,
      VATTypeNO: json['VATTypeNO'] as int? ?? 1,
      isPosted: json['isPosted'] ?? 0,
      note: json['note'] as String?,
      amountPayed01: json['amountPayed01'] as num? ?? 0,
      amountPayed02: json['amountPayed02'] as num? ?? 0,
      amountPayed03: json['amountPayed03'] as num? ?? 0,
      taxRate1_Total: json['taxRate1_Total'] as num? ?? 0,
      amountCalculatedPayed: json['amountCalculatedPayed'] as num? ?? 0,
    );

Map<String, dynamic> _$InvoiceSellEntityToJson(InvoiceSellEntity instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'userNumber': instance.userNumber,
      'clientVendorNo': instance.clientVendorNo,
      'aName': instance.aName,
      'eName': instance.eName,
      'subNetTotal': instance.subNetTotal,
      'subNetTotalPlusTax': instance.subNetTotalPlusTax,
      'subTotalDiscount': instance.subTotalDiscount,
      'dateG': instance.dateG,
      'invoiceVATID': instance.invoiceVATID,
      'telephone': instance.telephone,
      'buildingNo': instance.buildingNo,
      'amountLeft': instance.amountLeft,
      'amountPayed': instance.amountPayed,
      'paperBillNum': instance.paperBillNum,
      'StoreNo': instance.StoreNo,
      'VATTypeNO': instance.VATTypeNO,
      'isPosted': instance.isPosted,
      'note': instance.note,
      'amountPayed01': instance.amountPayed01,
      'amountPayed02': instance.amountPayed02,
      'amountPayed03': instance.amountPayed03,
      'taxRate1_Total': instance.taxRate1_Total,
      'amountCalculatedPayed': instance.amountCalculatedPayed,
    };
