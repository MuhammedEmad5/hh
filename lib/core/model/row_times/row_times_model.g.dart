// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowTimestamp _$RowTimestampFromJson(Map<String, dynamic> json) => RowTimestamp(
      type: json['type'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$RowTimestampToJson(RowTimestamp instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
