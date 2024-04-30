// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingConnection _$SettingConnectionFromJson(Map<String, dynamic> json) =>
    SettingConnection(
      connectionType: json['connectionType'] as String,
      protocol: json['protocol'] as String,
      apiTarget: json['apiTarget'] as String,
      instanceName: json['instanceName'] as String,
      databaseName: json['databaseName'] as String,
    );

Map<String, dynamic> _$SettingConnectionToJson(SettingConnection instance) =>
    <String, dynamic>{
      'connectionType': instance.connectionType,
      'protocol': instance.protocol,
      'apiTarget': instance.apiTarget,
      'instanceName': instance.instanceName,
      'databaseName': instance.databaseName,
    };
