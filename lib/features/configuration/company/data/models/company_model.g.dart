// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      VendorId: (json['VendorId'] as num?)?.toInt() ?? 0,
      companyNo: json['companyNo'] as num,
      dateG: json['dateG'] as String?,
      dateH: json['dateH'] as String?,
      aName: json['aName'] as String,
      eName: json['eName'] as String,
      officialAName: json['officialAName'] as String?,
      officialEName: json['officialEName'] as String?,
      dateOfEstablishment: json['dateOfEstablishment'] as String?,
      purpose: json['purpose'] as String?,
      businessRegistrationNo: json['businessRegistrationNo'] as String?,
      note: json['note'] as String?,
      GUIDNo: json['GUIDNo'] as String?,
      GUID2: json['GUID2'] as String?,
      GUID3: json['GUID3'] as String?,
      typeNo: (json['typeNo'] as num?)?.toInt(),
      isShowHeaderInfoInReports: json['isShowHeaderInfoInReports'] ?? 0,
      fileNo: json['fileNo'] as num?,
      buildingNo_Second: json['buildingNo_Second'] as num?,
      insuranceNum: json['insuranceNum'] as String?,
      companyNoOneInvoice: json['companyNoOneInvoice'] as num? ?? 0.0,
      telephone1: json['telephone1'] as String?,
      telephone2: json['telephone2'] as String?,
      aLocation: json['aLocation'] as String?,
      eLocation: json['eLocation'] as String?,
      companyIconLocation: json['companyIconLocation'] as String?,
      isUseDifferentLogoForA4: json['isUseDifferentLogoForA4'] ?? 0,
      companyIconLocationA4: json['companyIconLocationA4'] as String?,
      isIncludeBranchName: json['isIncludeBranchName'] ?? 0,
      apartmentNum: json['apartmentNum'] as String?,
      countrySubdivision_Arb: json['countrySubdivision_Arb'] as String?,
      countrySubdivision_Eng: json['countrySubdivision_Eng'] as String?,
      street_Arb: json['street_Arb'] as String?,
      street_Eng: json['street_Eng'] as String?,
      district_Arb: json['district_Arb'] as String?,
      district_Eng: json['district_Eng'] as String?,
      city_Arb: json['city_Arb'] as String?,
      city_Eng: json['city_Eng'] as String?,
      country_Arb: json['country_Arb'] as String?,
      country_Eng: json['country_Eng'] as String?,
      POBox: json['POBox'] as String?,
      POBoxAdditionalNum: json['POBoxAdditionalNum'] as String?,
      secondBusinessIDType: (json['secondBusinessIDType'] as num?)?.toInt(),
      secondBusinessID: json['secondBusinessID'] as String?,
      address: json['address'] as String?,
      report_link: json['report_link'] as String?,
      Msg_whatsappPhoneFrom: json['Msg_whatsappPhoneFrom'] as String?,
      Msg_SMSPhoneFrom: json['Msg_SMSPhoneFrom'] as String?,
      Msg_eMailFrom: json['Msg_eMailFrom'] as String?,
      Msg_whatsappPhoneManagers: json['Msg_whatsappPhoneManagers'] as String?,
      Msg_SMSPhoneManagers: json['Msg_SMSPhoneManagers'] as String?,
      Msg_eMailManagers: json['Msg_eMailManagers'] as String?,
      zatcaDeviceID: json['zatcaDeviceID'],
      zatcaToken: json['zatcaToken'],
      zatcaHash: json['zatcaHash'],
      zatcaStage: json['zatcaStage'],
      zatcaInvoiceType: json['zatcaInvoiceType'],
      countryNo: json['countryNo'] as num?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'VendorId': instance.VendorId,
      'companyNo': instance.companyNo,
      'dateG': instance.dateG,
      'dateH': instance.dateH,
      'aName': instance.aName,
      'eName': instance.eName,
      'officialAName': instance.officialAName,
      'officialEName': instance.officialEName,
      'dateOfEstablishment': instance.dateOfEstablishment,
      'purpose': instance.purpose,
      'businessRegistrationNo': instance.businessRegistrationNo,
      'note': instance.note,
      'GUIDNo': instance.GUIDNo,
      'GUID2': instance.GUID2,
      'GUID3': instance.GUID3,
      'typeNo': instance.typeNo,
      'isShowHeaderInfoInReports': instance.isShowHeaderInfoInReports,
      'fileNo': instance.fileNo,
      'buildingNo_Second': instance.buildingNo_Second,
      'insuranceNum': instance.insuranceNum,
      'companyNoOneInvoice': instance.companyNoOneInvoice,
      'telephone1': instance.telephone1,
      'telephone2': instance.telephone2,
      'aLocation': instance.aLocation,
      'eLocation': instance.eLocation,
      'companyIconLocation': instance.companyIconLocation,
      'isUseDifferentLogoForA4': instance.isUseDifferentLogoForA4,
      'companyIconLocationA4': instance.companyIconLocationA4,
      'isIncludeBranchName': instance.isIncludeBranchName,
      'apartmentNum': instance.apartmentNum,
      'countrySubdivision_Arb': instance.countrySubdivision_Arb,
      'countrySubdivision_Eng': instance.countrySubdivision_Eng,
      'street_Arb': instance.street_Arb,
      'street_Eng': instance.street_Eng,
      'district_Arb': instance.district_Arb,
      'district_Eng': instance.district_Eng,
      'city_Arb': instance.city_Arb,
      'city_Eng': instance.city_Eng,
      'country_Arb': instance.country_Arb,
      'country_Eng': instance.country_Eng,
      'POBox': instance.POBox,
      'POBoxAdditionalNum': instance.POBoxAdditionalNum,
      'secondBusinessIDType': instance.secondBusinessIDType,
      'secondBusinessID': instance.secondBusinessID,
      'address': instance.address,
      'report_link': instance.report_link,
      'Msg_whatsappPhoneFrom': instance.Msg_whatsappPhoneFrom,
      'Msg_SMSPhoneFrom': instance.Msg_SMSPhoneFrom,
      'Msg_eMailFrom': instance.Msg_eMailFrom,
      'Msg_whatsappPhoneManagers': instance.Msg_whatsappPhoneManagers,
      'Msg_SMSPhoneManagers': instance.Msg_SMSPhoneManagers,
      'Msg_eMailManagers': instance.Msg_eMailManagers,
      'zatcaDeviceID': instance.zatcaDeviceID,
      'zatcaToken': instance.zatcaToken,
      'zatcaHash': instance.zatcaHash,
      'zatcaStage': instance.zatcaStage,
      'zatcaInvoiceType': instance.zatcaInvoiceType,
      'countryNo': instance.countryNo,
    };
