import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/model/json_model.dart';

part 'company_unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyUnit implements JsonModel {
  int vendorId;
  num? referenceNo;
  int unitNo;
  String aName;
  String eName;
  dynamic isDeleted;
  dynamic isDisabled;
  num? operation_From_Offset;
  num? operation_Multiplicand;
  num? operation_Denominator;
  num? operation_ToOffset;
  dynamic isTimeUnit;

  CompanyUnit({
    this.vendorId = 0,
    this.referenceNo = 0,
    required this.unitNo,
    required this.aName,
    required this.eName,
    this.isDeleted = 0,
    this.isDisabled = 0,
    this.isTimeUnit = 0,
    this.operation_Denominator = 0,
    this.operation_From_Offset = 0,
    this.operation_Multiplicand = 0,
    this.operation_ToOffset = 0,
  });

  @override
  factory CompanyUnit.fromJson(Map<String, dynamic> json) =>
      _$CompanyUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyUnitToJson(this);
}
