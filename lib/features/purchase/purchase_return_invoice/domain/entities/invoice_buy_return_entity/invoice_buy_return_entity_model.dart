import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/model/business_model.dart';
import '../../../../../../core/navigation/navigation.dart';

part 'invoice_buy_return_entity_model.g.dart';

AppLocalizations _appLocalizations =
    AppLocalizations.of(AppNavigation.context)!;

@JsonSerializable(explicitToJson: true)
class InvoiceBuyReturnEntity implements BusinessModel {
  final int invoiceNo;
  final String userNumber;
  final num Inv_buildingNo;
  final int Inv_invoiceNo;
  final num? clientVendorNo;
  final String aName;
  final String eName;
  final num subNetTotal;
  final num subNetTotalPlusTax;
  final num subTotalDiscount;
  final String? dateG;
  final String? invoiceVATID;
  final String? telephone;
  final num buildingNo;
  final num amountLeft;
  final num amountPayed;
  final String? paperBillNum;
  final num StoreNo; // 1
  final num VATTypeNO; // 1
  final dynamic isPosted;
  final String? note;

  InvoiceBuyReturnEntity({
    this.clientVendorNo,
    required this.invoiceNo,
    this.userNumber = '0',
    required this.aName,
    required this.eName,
    required this.Inv_invoiceNo,
    required this.Inv_buildingNo,
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
  });

  @override
  List<String> getColumnNames() => [
        _appLocalizations.number,
        _appLocalizations.edit,
        _appLocalizations.arabic_name,
        _appLocalizations.english_name,
        // _appLocalizations.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(columnName: _appLocalizations.number, value: invoiceNo),
      DataGridCell<Widget>(columnName: _appLocalizations.edit, value: null),
      DataGridCell<String>(
          columnName: _appLocalizations.arabic_name, value: aName),
      DataGridCell<String>(
          columnName: _appLocalizations.english_name, value: eName),
      // DataGridCell<Widget>(columnName: _appLocalizations.delete, value: null),
      // DataGridCell<Widget>(columnName: 'Delete', value: null),
    ]);
  }

  @override
  factory InvoiceBuyReturnEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceBuyReturnEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceBuyReturnEntityToJson(this);
}
