import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/model/business_model.dart';
import '../../../../core/navigation/navigation.dart';

part 'item_entity_model.g.dart';

AppLocalizations _appLocalizations =
    AppLocalizations.of(AppNavigation.context)!;

@JsonSerializable(explicitToJson: true)
class ItemEntity implements BusinessModel {
  num itemNo;
  String aName;
  String eName;
  String barCode;
  int? unitNo_defaultSell;
  num itemClassificationTreeNo;
  num taxPurchasePercent;
  dynamic tax_isUseSeparateFieldsForTax;
  num buyPrice;
  num taxPurchaseAmount;
  num taxPercent;
  num sellPrice;
  num sellPrice2;
  num sellPrice3;
  num sellPrice4;
  num discount;
  num discount_Percentage;
  String userNumber;

  ItemEntity({
    required this.itemNo,
    this.aName = "منتج جديد",
    this.eName = "New Product",
    required this.barCode,
    required this.userNumber,
    this.unitNo_defaultSell = 1,
    this.itemClassificationTreeNo = 1,
    this.taxPurchasePercent = 0,
    this.tax_isUseSeparateFieldsForTax = 0,
    this.buyPrice = 0,
    this.taxPurchaseAmount = 0,
    this.taxPercent = 0,
    this.sellPrice = 0,
    this.sellPrice2 = 0,
    this.sellPrice3 = 0,
    this.sellPrice4 = 0,
    this.discount = 0,
    this.discount_Percentage = 0,
  });

  @override
  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ItemEntityToJson(this);

  @override
  List<String> getColumnNames() => [
        _appLocalizations.number,
        _appLocalizations.edit,
        _appLocalizations.arabic_name,
        _appLocalizations.english_name,
        _appLocalizations.sell_price,
        _appLocalizations.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(columnName: _appLocalizations.number, value: itemNo),
      DataGridCell<Widget>(columnName: _appLocalizations.edit, value: null),
      DataGridCell<String>(
          columnName: _appLocalizations.arabic_name, value: aName),
      DataGridCell<String>(
          columnName: _appLocalizations.english_name, value: eName),
      DataGridCell<num>(
          columnName: _appLocalizations.sell_price, value: sellPrice),
      DataGridCell<Widget>(columnName: _appLocalizations.delete, value: null),
    ]);
  }
}
