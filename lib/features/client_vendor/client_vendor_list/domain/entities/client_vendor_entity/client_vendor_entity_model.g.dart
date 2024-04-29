// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_vendor_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientVendorEntity _$ClientVendorEntityFromJson(Map<String, dynamic> json) =>
    ClientVendorEntity(
      clientVendorNo: json['clientVendorNo'] as num,
      typeOfClientOrVendor: json['typeOfClientOrVendor'] as int? ?? 1,
      VendorId: json['VendorId'] as int? ?? 0,
      aName: json['aName'] as String?,
      eName: json['eName'] as String?,
      aDescription: json['aDescription'] as String?,
      eDescription: json['eDescription'] as String?,
      mainContact1: json['mainContact1'] as String?,
      mainContact2: json['mainContact2'] as String?,
      mainContact3: json['mainContact3'] as String?,
      mainContact4: json['mainContact4'] as String?,
      VATID: json['VATID'] as String?,
      IDCard: json['IDCard'] as String?,
      address: json['address'] as String?,
      warnMaxBalance: json['warnMaxBalance'] as num? ?? 0.0,
      warnMinBalance: json['warnMinBalance'] as num? ?? 0.0,
      maxBalanceAllowed: json['maxBalanceAllowed'] as num? ?? 0.0,
      minBalanceAllowed: json['minBalanceAllowed'] as num? ?? 0.0,
      note: json['note'] as String?,
      apartmentNum: json['apartmentNum'] as String?,
      POBoxAdditionalNum: json['POBoxAdditionalNum'] as String?,
      POBox: json['POBox'] as String?,
      street_Eng: json['street_Eng'] as String?,
      street_Arb: json['street_Arb'] as String?,
      district_Arb: json['district_Arb'] as String?,
      district_Eng: json['district_Eng'] as String?,
      city_Eng: json['city_Eng'] as String?,
      city_Arb: json['city_Arb'] as String?,
      country_Arb: json['country_Arb'] as String? ?? 'السعودية',
      country_Eng: json['country_Eng'] as String? ?? 'Saudia',
      secondBusinessID: json['secondBusinessID'] as String?,
      secondBusinessIDType: json['secondBusinessIDType'] as int?,
    );

Map<String, dynamic> _$ClientVendorEntityToJson(ClientVendorEntity instance) =>
    <String, dynamic>{
      'clientVendorNo': instance.clientVendorNo,
      'VendorId': instance.VendorId,
      'typeOfClientOrVendor': instance.typeOfClientOrVendor,
      'aName': instance.aName,
      'eName': instance.eName,
      'aDescription': instance.aDescription,
      'eDescription': instance.eDescription,
      'mainContact1': instance.mainContact1,
      'mainContact2': instance.mainContact2,
      'mainContact3': instance.mainContact3,
      'mainContact4': instance.mainContact4,
      'VATID': instance.VATID,
      'IDCard': instance.IDCard,
      'address': instance.address,
      'warnMaxBalance': instance.warnMaxBalance,
      'warnMinBalance': instance.warnMinBalance,
      'maxBalanceAllowed': instance.maxBalanceAllowed,
      'minBalanceAllowed': instance.minBalanceAllowed,
      'note': instance.note,
      'apartmentNum': instance.apartmentNum,
      'POBoxAdditionalNum': instance.POBoxAdditionalNum,
      'POBox': instance.POBox,
      'street_Eng': instance.street_Eng,
      'street_Arb': instance.street_Arb,
      'district_Arb': instance.district_Arb,
      'district_Eng': instance.district_Eng,
      'city_Eng': instance.city_Eng,
      'city_Arb': instance.city_Arb,
      'country_Eng': instance.country_Eng,
      'country_Arb': instance.country_Arb,
      'secondBusinessID': instance.secondBusinessID,
      'secondBusinessIDType': instance.secondBusinessIDType,
    };
