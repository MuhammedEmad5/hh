import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/model/json_model.dart';

part 'company_model.g.dart';


@JsonSerializable(explicitToJson: true)
class Company implements JsonModel {
  int VendorId;
  num companyNo;
  String? dateG;
  String? dateH;
  String aName;
  String eName;
  String? officialAName;
  String? officialEName;
  String? dateOfEstablishment;
  String? purpose;
  String? businessRegistrationNo;
  String? note;
  String? GUIDNo;
  String? GUID2;
  String? GUID3;
  int? typeNo;
  dynamic isShowHeaderInfoInReports;
  num? fileNo;
  num? buildingNo_Second;
  String? insuranceNum;
  num? companyNoOneInvoice;
  String? telephone1;
  String? telephone2;
  String? aLocation;
  String? eLocation;
  String? companyIconLocation;
  dynamic isUseDifferentLogoForA4;
  String? companyIconLocationA4;
  dynamic isIncludeBranchName;
  String? apartmentNum;
  String? countrySubdivision_Arb;
  String? countrySubdivision_Eng;
  String? street_Arb;
  String? street_Eng;
  String? district_Arb;
  String? district_Eng;
  String? city_Arb;
  String? city_Eng;
  String? country_Arb;
  String? country_Eng;
  String? POBox;
  String? POBoxAdditionalNum;
  int? secondBusinessIDType;
  String? secondBusinessID;
  String? address;
  String? report_link;
  String? Msg_whatsappPhoneFrom;
  String? Msg_SMSPhoneFrom;
  String? Msg_eMailFrom;
  String? Msg_whatsappPhoneManagers;
  String? Msg_SMSPhoneManagers;
  String? Msg_eMailManagers;
  //RowTimestamp? rowTimestamp;
  dynamic zatcaDeviceID;
  dynamic zatcaToken;
  dynamic zatcaHash;
  dynamic zatcaStage;
  dynamic zatcaInvoiceType;
 // dynamic zatca_VATCategoryCodeSubType;
  num? countryNo;

  Company({
    this.VendorId = 0,
    required this.companyNo,
    this.dateG,
    this.dateH,
    required this.aName,
    required this.eName,
    this.officialAName,
    this.officialEName,
    this.dateOfEstablishment,
    this.purpose,
    this.businessRegistrationNo,
    this.note,
    this.GUIDNo,
    this.GUID2,
    this.GUID3,
    this.typeNo,
    this.isShowHeaderInfoInReports = 0,
    this.fileNo,
    this.buildingNo_Second,
    this.insuranceNum,
    this.companyNoOneInvoice = 0.000000,
    this.telephone1,
    this.telephone2,
    this.aLocation,
    this.eLocation,
    this.companyIconLocation,
    this.isUseDifferentLogoForA4 = 0 ,
    this.companyIconLocationA4,
    this.isIncludeBranchName = 0,
    this.apartmentNum,
    this.countrySubdivision_Arb,
    this.countrySubdivision_Eng,
    this.street_Arb,
    this.street_Eng,
    this.district_Arb,
    this.district_Eng,
    this.city_Arb,
    this.city_Eng,
    this.country_Arb,
   this.country_Eng,
    this.POBox,
    this.POBoxAdditionalNum,
    this.secondBusinessIDType,
    this.secondBusinessID,
    this.address,
    this.report_link,
    this.Msg_whatsappPhoneFrom,
    this.Msg_SMSPhoneFrom,
    this.Msg_eMailFrom,
    this.Msg_whatsappPhoneManagers,
    this.Msg_SMSPhoneManagers,
    this.Msg_eMailManagers,
    //this.rowTimestamp,
    this.zatcaDeviceID,
    this.zatcaToken,
    this.zatcaHash,
    this.zatcaStage,
    this.zatcaInvoiceType,
  //  this.zatca_VATCategoryCodeSubType,
    this.countryNo,
  });

  @override
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
