import 'package:InvoiceF_ClientVendor/core/model/business_model.dart';
import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'invoice_buy_return_entity_model.g.dart';

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
        AppLocalizations.of(AppNavigation.context)!.number,
        AppLocalizations.of(AppNavigation.context)!.edit,
        AppLocalizations.of(AppNavigation.context)!.arabic_name,
        AppLocalizations.of(AppNavigation.context)!.english_name,
        // AppLocalizations.of(AppNavigation.context)!.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(
          columnName: AppLocalizations.of(AppNavigation.context)!.number,
          value: invoiceNo),
      DataGridCell<Widget>(
          columnName: AppLocalizations.of(AppNavigation.context)!.edit,
          value: null),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.arabic_name,
          value: aName),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.english_name,
          value: eName),
      // DataGridCell<Widget>(columnName: AppLocalizations.of(AppNavigation.context)!.delete, value: null),
      // DataGridCell<Widget>(columnName: 'Delete', value: null),
    ]);
  }

  @override
  factory InvoiceBuyReturnEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceBuyReturnEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceBuyReturnEntityToJson(this);
}
