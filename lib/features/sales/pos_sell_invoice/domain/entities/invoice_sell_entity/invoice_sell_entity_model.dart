import 'package:InvoiceF/core/model/business_model.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'invoice_sell_entity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceSellEntity implements BusinessModel {
  final AppLocalizations _appLocalizations =
      AppLocalizations.of(AppNavigation.context)!;

  int invoiceNo;
  String userNumber;
  num? clientVendorNo;
  String aName;
  String eName;
  num subNetTotal;
  num subNetTotalPlusTax;
  num subTotalDiscount;
  String? dateG;
  String? invoiceVATID;
  String? telephone;
  num buildingNo;
  num amountLeft;
  num amountPayed;
  String? paperBillNum;
  num StoreNo; // 1
  int VATTypeNO; // 1
  dynamic isPosted;
  String? note;
  num amountPayed01;
  num amountPayed02;
  num amountPayed03;
  num taxRate1_Total;
  num amountCalculatedPayed;
  InvoiceSellEntity({
    this.clientVendorNo,
    required this.invoiceNo,
    required this.userNumber,
    required this.aName,
    required this.eName,
    this.subNetTotal = 0,
    this.subNetTotalPlusTax = 0,
    this.subTotalDiscount = 0,
    this.dateG,
    this.invoiceVATID,
    this.telephone,
    this.buildingNo = 1,
    this.amountLeft = 0,
    this.amountPayed = 0,
    this.paperBillNum,
    this.StoreNo = 1,
    this.VATTypeNO = 1,
    this.isPosted = 0,
    this.note,
    this.amountPayed01 = 0,
    this.amountPayed02 = 0,
    this.amountPayed03 = 0,
    this.taxRate1_Total = 0,
    this.amountCalculatedPayed = 0,
  });

  @override
  List<String> getColumnNames() => [
        _appLocalizations.number,
        _appLocalizations.edit,
        _appLocalizations.arabic_name,
        _appLocalizations.english_name,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: _appLocalizations.number, value: invoiceNo),
      DataGridCell<Widget>(columnName: _appLocalizations.edit, value: null),
      DataGridCell<String>(
          columnName: _appLocalizations.arabic_name, value: aName),
      DataGridCell<String>(
          columnName: _appLocalizations.english_name, value: eName),
      // DataGridCell<Widget>(columnName: 'Delete', value: null),
    ]);
  }

  @override
  factory InvoiceSellEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSellEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceSellEntityToJson(this);
}
