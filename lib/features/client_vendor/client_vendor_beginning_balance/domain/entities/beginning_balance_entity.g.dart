// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginning_balance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeginningBalanceEntity _$BeginningBalanceEntityFromJson(
        Map<String, dynamic> json) =>
    BeginningBalanceEntity(
      branchNumber: (json['branchNumber'] as num).toInt(),
      clientVendorNumber: (json['clientVendorNumber'] as num).toInt(),
      transactionNumber: (json['transactionNumber'] as num).toInt(),
      arabicName: json['arabicName'] as String,
      englishName: json['englishName'] as String?,
      debit: (json['debit'] as num).toDouble(),
      credit: (json['credit'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
      date: json['date'] as String,
      originalPaperBillNumber: json['originalPaperBillNumber'] as String?,
      invoiceVatId: json['invoiceVatId'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$BeginningBalanceEntityToJson(
        BeginningBalanceEntity instance) =>
    <String, dynamic>{
      'branchNumber': instance.branchNumber,
      'clientVendorNumber': instance.clientVendorNumber,
      'transactionNumber': instance.transactionNumber,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
      'originalPaperBillNumber': instance.originalPaperBillNumber,
      'invoiceVatId': instance.invoiceVatId,
      'date': instance.date,
      'debit': instance.debit,
      'credit': instance.credit,
      'balance': instance.balance,
      'note': instance.note,
    };
