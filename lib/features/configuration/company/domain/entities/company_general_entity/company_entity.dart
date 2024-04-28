import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';

import '../../../../../../core/model/business_model.dart';

part 'company_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyEntity implements BusinessModel {
  String? businessRegistrationNo;

  num companyNo;

  String arabicName;
  String englishName;

  String? dateOfEstablishment;

  String? telephone1;

  String? address;

  String? telephone2;
  String? officialArabicName;
  String? officialEnglishName;

  dynamic showHeaderInfoInReports;

  dynamic includeBranchName;

  String? target;

  String? note;

  String? buildingNo;

  String? additionalNo;

  String? postalCode;

  String? streetNameArabic;
  String? streetNameEnglish;
  String? districtArabic;
  String? districtEnglish;
  String? cityArabic;
  String? cityEnglish;
  String? countryArabic;
  String? countryEnglish;

  String? secondBusinessID;
  int? secondBusinessIDType;

  String? companyIconLocation80mm;
  dynamic isUseDifferentLogoForA4;
  String? companyIconLocationA4;

  CompanyEntity(
      {
         this.businessRegistrationNo,
      required this.companyNo,
      required this.arabicName,
      required this.englishName,
      this.dateOfEstablishment,
       this.telephone1,
       this.address,
      this.telephone2,
       this.officialArabicName,
      this.officialEnglishName,
      this.showHeaderInfoInReports,
      this.includeBranchName,
      this.target,
      this.note,
        this.buildingNo,
      this.additionalNo,
      this.postalCode,
       this.streetNameArabic,
      this.streetNameEnglish,
       this.districtArabic,
      this.districtEnglish,
       this.cityArabic,
      this.cityEnglish,
       this.countryArabic,
      this.countryEnglish,
      this.secondBusinessID,
      this.secondBusinessIDType,
      this.companyIconLocation80mm,
      this.isUseDifferentLogoForA4,
      this.companyIconLocationA4});

  @override
  List<String> getColumnNames() => [
        'businessRegistrationNo',
        'companyNo',
        'arabicName',
        'englishName',
        'dateOfEstablishment',
        'telephone1',
        'address',
        'telephone2',
        'officialArabicName',
        'officialEnglishName',
        'showHeaderInfoInReports',
        'includeBranchName',
        'target',
        'note',
        'buildingNo',
        'additionalNo',
        'postalCode',
        'streetNameArabic',
        'streetNameEnglish',
        'districtArabic',
        'districtEnglish',
        'cityArabic',
        'cityEnglish',
        'countryArabic',
        'countryEnglish',
        'secondBusinessID',
        'secondBusinessIDType',
        'companyIconLocation80mm',
        'isUseDifferentLogoForA4',
        'companyIconLocationA4',
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'businessRegistrationNo', value: businessRegistrationNo),
      DataGridCell<num>(columnName: 'companyNo', value: companyNo),
      DataGridCell<String>(columnName: 'arabicName', value: arabicName),
      DataGridCell<String>(columnName: 'englishName', value: englishName),
      DataGridCell<String>(
          columnName: 'dateOfEstablishment', value: dateOfEstablishment),
      DataGridCell<String>(columnName: 'telephone1', value: telephone1),
      DataGridCell<String>(columnName: 'address', value: address),
      DataGridCell<String>(columnName: 'telephone2', value: telephone2),
      DataGridCell<String>(
          columnName: 'officialArabicName', value: officialArabicName),
      DataGridCell<String>(
          columnName: 'officialEnglishName', value: officialEnglishName),
      DataGridCell<String>(
          columnName: 'showHeaderInfoInReports',
          value: showHeaderInfoInReports),
      DataGridCell<String>(
          columnName: 'includeBranchName', value: includeBranchName),
      DataGridCell<String>(columnName: 'target', value: target),
      DataGridCell<String>(columnName: 'note', value: note),
      DataGridCell<String>(columnName: 'buildingNo', value: buildingNo),
      DataGridCell<String>(columnName: 'additionalNo', value: additionalNo),
      DataGridCell<String>(columnName: 'postalCode', value: postalCode),
      DataGridCell<String>(
          columnName: 'streetNameArabic', value: streetNameArabic),
      DataGridCell<String>(
          columnName: 'streetNameEnglish', value: streetNameEnglish),
      DataGridCell<String>(columnName: 'districtArabic', value: districtArabic),
      DataGridCell<String>(
          columnName: 'districtEnglish', value: districtEnglish),
      DataGridCell<String>(columnName: 'cityArabic', value: cityArabic),
      DataGridCell<String>(columnName: 'cityEnglish', value: cityEnglish),
      DataGridCell<String>(columnName: 'countryArabic', value: countryArabic),
      DataGridCell<String>(columnName: 'countryEnglish', value: countryEnglish),
      DataGridCell<String>(
          columnName: 'secondBusinessID', value: secondBusinessID),
      DataGridCell<int>(
          columnName: 'secondBusinessIDType', value: secondBusinessIDType),
      DataGridCell<String>(
          columnName: 'companyIconLocation80mm',
          value: companyIconLocation80mm),
      DataGridCell<String>(
          columnName: 'isUseDifferentLogoForA4',
          value: isUseDifferentLogoForA4),
      DataGridCell<String>(
          columnName: 'companyIconLocationA4', value: companyIconLocationA4),
    ]);
  }

  @override
  factory CompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyEntityToJson(this);
}
