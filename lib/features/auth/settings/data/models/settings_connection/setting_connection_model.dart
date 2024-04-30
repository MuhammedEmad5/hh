import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_connection_model.g.dart';

@JsonSerializable()
class SettingConnection {
  String connectionType;
  String protocol;
  String apiTarget;
  String instanceName;
  String databaseName;

  SettingConnection({
    required this.connectionType,
    required this.protocol,
    required this.apiTarget,
    required this.instanceName,
    required this.databaseName,
  });


  @override
  factory SettingConnection.fromJson(Map<String, dynamic> json) =>
      _$SettingConnectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SettingConnectionToJson(this);


}
