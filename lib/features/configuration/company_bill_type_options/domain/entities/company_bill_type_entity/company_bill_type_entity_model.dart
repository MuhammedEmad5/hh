import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';

import '../../../../../../core/model/business_model.dart';

part 'company_bill_type_entity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyBillTypeEntity implements BusinessModel {
  int billTypeNo;
  int? report_OnPostTypeNo;
  int VATTypeNo;
  int VATGroupNo;
  String? reportUnderHeader;
  String? reportUnderHeader_En;
  String? reportUnderDataStatement;

  CompanyBillTypeEntity({
    required this.billTypeNo,
    this.report_OnPostTypeNo,
    this.VATTypeNo = 0,
    this.VATGroupNo = 0,
    this.reportUnderHeader,
    this.reportUnderHeader_En,
    this.reportUnderDataStatement,
  });

  @override
  factory CompanyBillTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyBillTypeEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyBillTypeEntityToJson(this);

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
