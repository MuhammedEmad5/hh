// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_bill_type_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBillTypeEntity _$CompanyBillTypeEntityFromJson(
        Map<String, dynamic> json) =>
    CompanyBillTypeEntity(
      billTypeNo: (json['billTypeNo'] as num).toInt(),
      report_OnPostTypeNo: (json['report_OnPostTypeNo'] as num?)?.toInt(),
      VATTypeNo: (json['VATTypeNo'] as num?)?.toInt(),
      VATGroupNo: (json['VATGroupNo'] as num?)?.toInt(),
      reportUnderHeader: json['reportUnderHeader'] as String?,
      reportUnderHeader_En: json['reportUnderHeader_En'] as String?,
      reportUnderDataStatement: json['reportUnderDataStatement'] as String?,
    );

Map<String, dynamic> _$CompanyBillTypeEntityToJson(
        CompanyBillTypeEntity instance) =>
    <String, dynamic>{
      'billTypeNo': instance.billTypeNo,
      'report_OnPostTypeNo': instance.report_OnPostTypeNo,
      'VATTypeNo': instance.VATTypeNo,
      'VATGroupNo': instance.VATGroupNo,
      'reportUnderHeader': instance.reportUnderHeader,
      'reportUnderHeader_En': instance.reportUnderHeader_En,
      'reportUnderDataStatement': instance.reportUnderDataStatement,
    };
