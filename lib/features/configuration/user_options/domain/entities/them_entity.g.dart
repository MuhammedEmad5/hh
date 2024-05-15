// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'them_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeEntity _$ThemeEntityFromJson(Map<String, dynamic> json) => ThemeEntity(
      themeNumber: (json['themeNumber'] as num).toInt(),
      codeName: json['codeName'] as String,
    );

Map<String, dynamic> _$ThemeEntityToJson(ThemeEntity instance) =>
    <String, dynamic>{
      'themeNumber': instance.themeNumber,
      'codeName': instance.codeName,
    };
