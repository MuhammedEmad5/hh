import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/model/business_model.dart';
import '../../../../../core/navigation/navigation.dart';

part 'item_entity_model.g.dart';

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
        AppLocalizations.of(AppNavigation.context)!.number,
        AppLocalizations.of(AppNavigation.context)!.edit,
        AppLocalizations.of(AppNavigation.context)!.arabic_name,
        AppLocalizations.of(AppNavigation.context)!.english_name,
        AppLocalizations.of(AppNavigation.context)!.sell_price,
        AppLocalizations.of(AppNavigation.context)!.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(
          columnName: AppLocalizations.of(AppNavigation.context)!.number,
          value: itemNo),
      DataGridCell<Widget>(
          columnName: AppLocalizations.of(AppNavigation.context)!.edit,
          value: null),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.arabic_name,
          value: aName),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.english_name,
          value: eName),
      DataGridCell<num>(
          columnName: AppLocalizations.of(AppNavigation.context)!.sell_price,
          value: sellPrice),
      DataGridCell<Widget>(
          columnName: AppLocalizations.of(AppNavigation.context)!.delete,
          value: null),
    ]);
  }
}
