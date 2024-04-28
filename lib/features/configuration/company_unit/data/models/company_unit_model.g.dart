// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyUnit _$CompanyUnitFromJson(Map<String, dynamic> json) => CompanyUnit(
      vendorId: (json['vendorId'] as num?)?.toInt() ?? 0,
      referenceNo: json['referenceNo'] as num? ?? 0,
      unitNo: (json['unitNo'] as num).toInt(),
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      isDeleted: json['isDeleted'] ?? 0,
      isDisabled: json['isDisabled'] ?? 0,
      isTimeUnit: json['isTimeUnit'] ?? 0,
      operation_Denominator: json['operation_Denominator'] as num? ?? 0,
      operation_From_Offset: json['operation_From_Offset'] as num? ?? 0,
      operation_Multiplicand: json['operation_Multiplicand'] as num? ?? 0,
      operation_ToOffset: json['operation_ToOffset'] as num? ?? 0,
    );

Map<String, dynamic> _$CompanyUnitToJson(CompanyUnit instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'referenceNo': instance.referenceNo,
      'unitNo': instance.unitNo,
      'aName': instance.aName,
      'eName': instance.eName,
      'isDeleted': instance.isDeleted,
      'isDisabled': instance.isDisabled,
      'operation_From_Offset': instance.operation_From_Offset,
      'operation_Multiplicand': instance.operation_Multiplicand,
      'operation_Denominator': instance.operation_Denominator,
      'operation_ToOffset': instance.operation_ToOffset,
      'isTimeUnit': instance.isTimeUnit,
    };
