// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      businessRegistrationNo: json['businessRegistrationNo'] as String?,
      companyNo: json['companyNo'] as num,
      arabicName: json['arabicName'] as String,
      englishName: json['englishName'] as String,
      dateOfEstablishment: json['dateOfEstablishment'] as String?,
      telephone1: json['telephone1'] as String?,
      address: json['address'] as String?,
      telephone2: json['telephone2'] as String?,
      officialArabicName: json['officialArabicName'] as String?,
      officialEnglishName: json['officialEnglishName'] as String?,
      showHeaderInfoInReports: json['showHeaderInfoInReports'],
      includeBranchName: json['includeBranchName'],
      target: json['target'] as String?,
      note: json['note'] as String?,
      buildingNo: json['buildingNo'] as String?,
      additionalNo: json['additionalNo'] as String?,
      postalCode: json['postalCode'] as String?,
      streetNameArabic: json['streetNameArabic'] as String?,
      streetNameEnglish: json['streetNameEnglish'] as String?,
      districtArabic: json['districtArabic'] as String?,
      districtEnglish: json['districtEnglish'] as String?,
      cityArabic: json['cityArabic'] as String?,
      cityEnglish: json['cityEnglish'] as String?,
      countryArabic: json['countryArabic'] as String?,
      countryEnglish: json['countryEnglish'] as String?,
      secondBusinessID: json['secondBusinessID'] as String?,
      secondBusinessIDType: (json['secondBusinessIDType'] as num?)?.toInt(),
      companyIconLocation80mm: json['companyIconLocation80mm'] as String?,
      isUseDifferentLogoForA4: json['isUseDifferentLogoForA4'],
      companyIconLocationA4: json['companyIconLocationA4'] as String?,
    );

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'businessRegistrationNo': instance.businessRegistrationNo,
      'companyNo': instance.companyNo,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
      'dateOfEstablishment': instance.dateOfEstablishment,
      'telephone1': instance.telephone1,
      'address': instance.address,
      'telephone2': instance.telephone2,
      'officialArabicName': instance.officialArabicName,
      'officialEnglishName': instance.officialEnglishName,
      'showHeaderInfoInReports': instance.showHeaderInfoInReports,
      'includeBranchName': instance.includeBranchName,
      'target': instance.target,
      'note': instance.note,
      'buildingNo': instance.buildingNo,
      'additionalNo': instance.additionalNo,
      'postalCode': instance.postalCode,
      'streetNameArabic': instance.streetNameArabic,
      'streetNameEnglish': instance.streetNameEnglish,
      'districtArabic': instance.districtArabic,
      'districtEnglish': instance.districtEnglish,
      'cityArabic': instance.cityArabic,
      'cityEnglish': instance.cityEnglish,
      'countryArabic': instance.countryArabic,
      'countryEnglish': instance.countryEnglish,
      'secondBusinessID': instance.secondBusinessID,
      'secondBusinessIDType': instance.secondBusinessIDType,
      'companyIconLocation80mm': instance.companyIconLocation80mm,
      'isUseDifferentLogoForA4': instance.isUseDifferentLogoForA4,
      'companyIconLocationA4': instance.companyIconLocationA4,
    };
