import 'package:json_annotation/json_annotation.dart';

part 'device_option_entity_model.g.dart';


@JsonSerializable()
class DeviceOptionEntity {
  num? filterFromDays;
  String? dataFilter;
  String? touchScaleFactor;
  bool? touchUIMode;
  bool? showStatusBar;
  bool? warningOnApplicationExit;
  bool? askForDatabaseBackup;
  String? first80mmPCLogoIcon;
  String? firstA4PCLogoIcon;
  String? second80mmPCLogoIcon;
  String? secondA4PCLogoIcon;

  DeviceOptionEntity({
    this.filterFromDays,
    this.dataFilter,
    this.touchScaleFactor,
    this.touchUIMode,
    this.showStatusBar,
    this.warningOnApplicationExit,
    this.askForDatabaseBackup,
    this.first80mmPCLogoIcon,
    this.firstA4PCLogoIcon,
    this.second80mmPCLogoIcon,
    this.secondA4PCLogoIcon,
  });

  @override
  factory DeviceOptionEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceOptionEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceOptionEntityToJson(this);
}
