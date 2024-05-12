// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankEntity _$BankEntityFromJson(Map<String, dynamic> json) => BankEntity(
      bankAccountNumber: (json['bankAccountNumber'] as num).toInt(),
      userNumber: json['userNumber'] as String,
      arabicName: json['arabicName'] as String,
      englishName: json['englishName'] as String?,
    );

Map<String, dynamic> _$BankEntityToJson(BankEntity instance) =>
    <String, dynamic>{
      'bankAccountNumber': instance.bankAccountNumber,
      'userNumber': instance.userNumber,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
    };
