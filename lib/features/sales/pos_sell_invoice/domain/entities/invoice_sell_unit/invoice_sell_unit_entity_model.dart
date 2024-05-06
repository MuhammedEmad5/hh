import 'package:InvoiceF/core/model/business_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_sell_unit_entity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceSellUnitEntity implements BusinessModel {
  int invoiceNo;
  num buildingNo;
  int orderNo;
  num? itemNo;
  int? unitNo;
  String aName;
  String eName;
  num quantity;
  num price;
  num discount;
  num discountPercent;
  num discountTotal;
  num totalPlusTax;
  num taxRate1_Total;
  num taxRate1_Percentage;
  num total;
  String barCode;
  InvoiceSellUnitEntity({
    this.invoiceNo = 0,
    this.buildingNo = 0,
    this.orderNo = 0,
    this.itemNo = 0,
    this.unitNo = 0,
    required this.aName,
    required this.eName,
    this.quantity = 0,
    this.price = 0,
    this.discount = 0,
    this.discountPercent = 0,
    this.discountTotal = 0,
    this.total = 0,
    this.taxRate1_Percentage = 0,
    this.taxRate1_Total = 0,
    this.totalPlusTax = 0,
    this.barCode = '0',
  });

  @override
  List<String> getColumnNames() =>
      ['No.', 'Edit', 'Arabic Name', 'English Name', 'Delete'];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: 'No.', value: invoiceNo),
      DataGridCell<Widget>(columnName: 'Edit', value: null),
      DataGridCell<String>(columnName: 'Arabic Name', value: aName),
      DataGridCell<String>(columnName: 'English Name', value: eName),
      DataGridCell<Widget>(columnName: 'Delete', value: null),
    ]);
  }

  @override
  factory InvoiceSellUnitEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSellUnitEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceSellUnitEntityToJson(this);
}
