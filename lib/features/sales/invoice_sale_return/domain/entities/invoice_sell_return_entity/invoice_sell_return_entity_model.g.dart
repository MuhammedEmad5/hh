// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_sell_return_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceSellReturnEntity _$InvoiceSellReturnEntityFromJson(
        Map<String, dynamic> json) =>
    InvoiceSellReturnEntity(
      clientVendorNo: json['clientVendorNo'] as num?,
      invoiceNo: json['invoiceNo'] as int,
      userNumber: json['userNumber'] as String? ?? '0',
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      Inv_invoiceNo: json['Inv_invoiceNo'] as int,
      Inv_buildingNo: json['Inv_buildingNo'] as num,
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
      VATTypeNO: json['VATTypeNO'] as num? ?? 1,
      isPosted: json['isPosted'] ?? 0,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$InvoiceSellReturnEntityToJson(
        InvoiceSellReturnEntity instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'userNumber': instance.userNumber,
      'clientVendorNo': instance.clientVendorNo,
      'Inv_buildingNo': instance.Inv_buildingNo,
      'Inv_invoiceNo': instance.Inv_invoiceNo,
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
    };
