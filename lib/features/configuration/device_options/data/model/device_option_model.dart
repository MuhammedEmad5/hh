import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/model/json_model.dart';

part 'device_option_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeviceOptionModel implements JsonModel {
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

  DeviceOptionModel({
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
  factory DeviceOptionModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceOptionModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeviceOptionModelToJson(this);
}
