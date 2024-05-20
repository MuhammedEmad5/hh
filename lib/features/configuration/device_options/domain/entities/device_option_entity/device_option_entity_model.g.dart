// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_option_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceOptionEntity _$DeviceOptionEntityFromJson(Map<String, dynamic> json) =>
    DeviceOptionEntity(
      filterFromDays: json['filterFromDays'] as num?,
      dataFilter: json['dataFilter'] as String?,
      touchScaleFactor: json['touchScaleFactor'] as String?,
      touchUIMode: json['touchUIMode'] as bool?,
      showStatusBar: json['showStatusBar'] as bool?,
      warningOnApplicationExit: json['warningOnApplicationExit'] as bool?,
      askForDatabaseBackup: json['askForDatabaseBackup'] as bool?,
      first80mmPCLogoIcon: json['first80mmPCLogoIcon'] as String?,
      firstA4PCLogoIcon: json['firstA4PCLogoIcon'] as String?,
      second80mmPCLogoIcon: json['second80mmPCLogoIcon'] as String?,
      secondA4PCLogoIcon: json['secondA4PCLogoIcon'] as String?,
    );

Map<String, dynamic> _$DeviceOptionEntityToJson(DeviceOptionEntity instance) =>
    <String, dynamic>{
      'filterFromDays': instance.filterFromDays,
      'dataFilter': instance.dataFilter,
      'touchScaleFactor': instance.touchScaleFactor,
      'touchUIMode': instance.touchUIMode,
      'showStatusBar': instance.showStatusBar,
      'warningOnApplicationExit': instance.warningOnApplicationExit,
      'askForDatabaseBackup': instance.askForDatabaseBackup,
      'first80mmPCLogoIcon': instance.first80mmPCLogoIcon,
      'firstA4PCLogoIcon': instance.firstA4PCLogoIcon,
      'second80mmPCLogoIcon': instance.second80mmPCLogoIcon,
      'secondA4PCLogoIcon': instance.secondA4PCLogoIcon,
    };
