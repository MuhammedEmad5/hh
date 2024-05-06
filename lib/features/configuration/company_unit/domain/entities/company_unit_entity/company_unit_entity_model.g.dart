// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_unit_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyUnitEntity _$CompanyUnitEntityFromJson(Map<String, dynamic> json) =>
    CompanyUnitEntity(
      unitNo: (json['unitNo'] as num).toInt(),
      aName: json['aName'] as String,
      eName: json['eName'] as String,
    );

Map<String, dynamic> _$CompanyUnitEntityToJson(CompanyUnitEntity instance) =>
    <String, dynamic>{
      'unitNo': instance.unitNo,
      'aName': instance.aName,
      'eName': instance.eName,
    };
