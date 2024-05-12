import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';

import '../../../../../../core/model/business_model.dart';

part 'company_unit_entity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyUnitEntity implements BusinessModel {
  int unitNo;
  String aName;
  String eName;

  CompanyUnitEntity({
    required this.unitNo,
    required this.aName,
    required this.eName,
  });

  @override
  factory CompanyUnitEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyUnitEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyUnitEntityToJson(this);

  @override
  List<String> getColumnNames() {
    // TODO: implement getColumnNames
    throw UnimplementedError();
  }

  @override
  DataGridRow getDataGridRow() {
    // TODO: implement getDataGridRow
    throw UnimplementedError();
  }
}
