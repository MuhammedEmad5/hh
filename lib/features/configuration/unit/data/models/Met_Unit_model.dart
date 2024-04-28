import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/model/json_model.dart';

part 'Met_Unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Met_Unit implements JsonModel {
  num referenceNo;
  String? aName;
  String? eName;
  Met_Unit({
    required this.referenceNo,
    this.aName,
    this.eName,
  });

  @override
  factory Met_Unit.fromJson(Map<String, dynamic> json) =>
      _$Met_UnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Met_UnitToJson(this);
}
