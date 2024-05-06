import 'package:InvoiceF/core/model/business_model.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'client_vendor_entity_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ClientVendorEntity implements BusinessModel {
  num clientVendorNo;
  int VendorId;
  int? typeOfClientOrVendor;
  String? aName;
  String? eName;
  String? aDescription;
  String? eDescription;
  String? mainContact1;
  String? mainContact2;
  String? mainContact3;
  String? mainContact4;
  String? VATID;
  String? IDCard;
  String? address;
  num warnMaxBalance;
  num warnMinBalance;
  num maxBalanceAllowed;
  num minBalanceAllowed;
  String? note;
  String? apartmentNum;
  String? POBoxAdditionalNum;
  String? POBox;
  String? street_Eng;
  String? street_Arb;
  String? district_Arb;
  String? district_Eng;
  String? city_Eng;
  String? city_Arb;
  String country_Eng;
  String country_Arb;
  String? secondBusinessID;
  int? secondBusinessIDType;

  ClientVendorEntity({
    required this.clientVendorNo,
    this.typeOfClientOrVendor = 1,
    this.VendorId = 0,
    this.aName,
    this.eName,
    this.aDescription,
    this.eDescription,
    this.mainContact1,
    this.mainContact2,
    this.mainContact3,
    this.mainContact4,
    this.VATID,
    this.IDCard,
    this.address,
    this.warnMaxBalance = 0.0,
    this.warnMinBalance = 0.0,
    this.maxBalanceAllowed = 0.0,
    this.minBalanceAllowed = 0.0,
    this.note,
    this.apartmentNum,
    this.POBoxAdditionalNum,
    this.POBox,
    this.street_Eng,
    this.street_Arb,
    this.district_Arb,
    this.district_Eng,
    this.city_Eng,
    this.city_Arb,
    this.country_Arb = 'السعودية',
    this.country_Eng = 'Saudia',
    this.secondBusinessID,
    this.secondBusinessIDType,
  });

  @override
  factory ClientVendorEntity.fromJson(Map<String, dynamic> json) =>
      _$ClientVendorEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClientVendorEntityToJson(this);

  @override
  List<String> getColumnNames() => [
        AppLocalizations.of(AppNavigation.context)!.number,
        AppLocalizations.of(AppNavigation.context)!.edit,
        AppLocalizations.of(AppNavigation.context)!.arabic_name,
        AppLocalizations.of(AppNavigation.context)!.english_name,
        AppLocalizations.of(AppNavigation.context)!.contact1,
        AppLocalizations.of(AppNavigation.context)!.vat_no,
        AppLocalizations.of(AppNavigation.context)!.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(
          columnName: AppLocalizations.of(AppNavigation.context)!.number,
          value: clientVendorNo),
      DataGridCell<Widget>(
          columnName: AppLocalizations.of(AppNavigation.context)!.edit,
          value: null),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.arabic_name,
          value: aName),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.english_name,
          value: eName),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.contact1,
          value: mainContact1),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.vat_no,
          value: VATID),
      DataGridCell<Widget>(
          columnName: AppLocalizations.of(AppNavigation.context)!.delete,
          value: null),
    ]);
  }
}
