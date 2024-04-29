import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../core/model/business_model.dart';
import '../../../../../../core/navigation/navigation.dart';

part 'client_vendor_entity_model.g.dart';

AppLocalizations _appLocalizations =
    AppLocalizations.of(AppNavigation.context)!;

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
        _appLocalizations.number,
        _appLocalizations.edit,
        _appLocalizations.arabic_name,
        _appLocalizations.english_name,
        _appLocalizations.contact1,
        _appLocalizations.vat_no,
        _appLocalizations.delete,
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(
          columnName: _appLocalizations.number, value: clientVendorNo),
      DataGridCell<Widget>(columnName: _appLocalizations.edit, value: null),
      DataGridCell<String>(
          columnName: _appLocalizations.arabic_name, value: aName),
      DataGridCell<String>(
          columnName: _appLocalizations.english_name, value: eName),
      DataGridCell<String>(
          columnName: _appLocalizations.contact1, value: mainContact1),
      DataGridCell<String>(columnName: _appLocalizations.vat_no, value: VATID),
      DataGridCell<Widget>(columnName: _appLocalizations.delete, value: null),
    ]);
  }
}
