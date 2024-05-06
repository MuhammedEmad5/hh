import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/company_general_entity/company_entity.dart';
import '../models/company_model.dart';
import 'company_mapper.auto_mappr.dart';

@AutoMappr([
  ///from CompanyEntity to Company
  ///this what will add to db
  MapType<CompanyEntity, Company>(fields: [
    Field('aName', from: 'arabicName'),
    Field('eName', from: 'englishName'),
    Field('officialAName', custom: CompanyMapper.arabicName),
    Field('officialEName', custom: CompanyMapper.englishName),
    Field('isShowHeaderInfoInReports', from: 'showHeaderInfoInReports'),
    Field('isIncludeBranchName', from: 'includeBranchName'),
    Field('purpose', custom: CompanyMapper.target),
    Field('note', custom: CompanyMapper.note),
    Field('telephone1', custom: CompanyMapper.telephone1),
    Field('telephone2', custom: CompanyMapper.telephone2),
    Field('apartmentNum', custom: CompanyMapper.buildingNo),
    Field('POBoxAdditionalNum', custom: CompanyMapper.additionalNo),
    Field('POBox',custom: CompanyMapper.postalCode),
    Field('address',custom: CompanyMapper.address),
    Field("businessRegistrationNo", custom: CompanyMapper.businessRegistrationNo),
    Field('street_Arb', custom: CompanyMapper.streetArabic),
    Field('street_Eng', custom: CompanyMapper.streetEnglish),
    Field('district_Arb', custom: CompanyMapper.districtArabic),
    Field('district_Eng', custom: CompanyMapper.districtEnglish),
    Field('city_Arb', custom: CompanyMapper.cityArabic),
    Field('city_Eng', custom: CompanyMapper.cityEnglish),
    Field('country_Arb', custom: CompanyMapper.countryArabic),
    Field('country_Eng', custom: CompanyMapper.countryEnglish),
    Field('companyIconLocation', from: 'companyIconLocation80mm'),


  ]),

  ///from company to companyGeneral
  ///this what will show to the user
  MapType<Company, CompanyEntity>(fields: [
    Field('arabicName', from: 'aName'),
    Field('englishName', from: 'eName'),
    Field('officialArabicName', from: 'officialAName'),
    Field('officialEnglishName', from: 'officialEName'),
    Field('showHeaderInfoInReports', from: 'isShowHeaderInfoInReports'),
    Field('includeBranchName', from: 'isIncludeBranchName'),
    Field('target', from: 'purpose'),
    Field('buildingNo', from: 'apartmentNum'),
    Field('additionalNo', from: 'POBoxAdditionalNum'),
    Field('postalCode', from: 'POBox'),
    Field('streetNameArabic', from: 'street_Arb'),
    Field('streetNameEnglish', from: 'street_Eng'),
    Field('districtArabic', from: 'district_Arb'),
    Field('districtEnglish', from: 'district_Eng'),
    Field('cityArabic', from: 'city_Arb'),
    Field('cityEnglish', from: 'city_Eng'),
    Field('countryArabic', from: 'country_Arb'),
    Field('countryEnglish', from: 'country_Eng'),
    Field('companyIconLocation80mm', from: 'companyIconLocation'),
  ]),
])
class CompanyMapper extends $CompanyMapper {


  static String? arabicName(CompanyEntity companyEntity) {

    if( companyEntity.officialArabicName == ""){
      return null;
    }
    return companyEntity.officialArabicName;

  }
  static String? englishName(CompanyEntity companyEntity) {

    if( companyEntity.officialEnglishName == ""){
      return null;
    }
    return companyEntity.officialEnglishName;

  }
  static String? target(CompanyEntity companyEntity) {

    if( companyEntity.target == ""){
      return null;
    }
    return companyEntity.target;

  }
  static String? note(CompanyEntity companyEntity) {

    if( companyEntity.note == ""){
      return null;
    }
    return companyEntity.note;

  }
  static String? telephone1(CompanyEntity companyEntity) {

    if( companyEntity.telephone1 == ""){
      return null;
    }
    return companyEntity.telephone1;

  }
  static String? postalCode(CompanyEntity companyEntity) {

    if( companyEntity.postalCode == ""){
      return null;
    }
    return companyEntity.postalCode;

  }
  static String? additionalNo(CompanyEntity companyEntity) {

    if( companyEntity.additionalNo == ""){
      return null;
    }
    return companyEntity.additionalNo;

  }
  static String? address(CompanyEntity companyEntity) {

    if( companyEntity.address == ""){
      return null;
    }
    return companyEntity.address;

  }
  static String? streetArabic(CompanyEntity companyEntity) {

    if( companyEntity.streetNameArabic == ""){
      return null;
    }
    return companyEntity.streetNameArabic;

  }
  static String? streetEnglish(CompanyEntity companyEntity) {

    if( companyEntity.streetNameEnglish == ""){
      return null;
    }
    return companyEntity.streetNameEnglish;

  }
  static String? districtEnglish(CompanyEntity companyEntity) {

    if( companyEntity.districtEnglish == ""){
      return null;
    }
    return companyEntity.districtEnglish;

  }
  static String? districtArabic(CompanyEntity companyEntity) {

    if( companyEntity.districtArabic == ""){
      return null;
    }
    return companyEntity.districtArabic;

  }
  static String? cityArabic(CompanyEntity companyEntity) {

    if( companyEntity.cityArabic == ""){
      return null;
    }
    return companyEntity.cityArabic;

  }
  static String? cityEnglish(CompanyEntity companyEntity) {

    if( companyEntity.cityEnglish == ""){
      return null;
    }
    return companyEntity.cityEnglish;

  }
  static String? telephone2(CompanyEntity companyEntity) {

    if( companyEntity.telephone2 == ""){
      return null;
    }
    return companyEntity.telephone2;

  }
  static String? buildingNo(CompanyEntity companyEntity) {

    if( companyEntity.buildingNo == ""){
      return null;
    }
    return companyEntity.buildingNo;

  }
  static String? countryArabic(CompanyEntity companyEntity) {

    if( companyEntity.countryArabic == "" || companyEntity.countryArabic == null){
      return "السعودية";
    }
    return companyEntity.countryArabic;

  }

  static String? countryEnglish(CompanyEntity companyEntity) {

    if( companyEntity.countryEnglish == "" || companyEntity.countryEnglish == null){
      return "Saudia";
    }
    return companyEntity.countryEnglish;

  }
  static String? businessRegistrationNo(CompanyEntity companyEntity) {

    if( companyEntity.businessRegistrationNo == "" || companyEntity.businessRegistrationNo == null){
      return companyEntity.companyNo.toString();
    }
    return companyEntity.businessRegistrationNo;

  }






}
