// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      personNumber: json['personNumber'] as int,
      email: json['email'] as String,
      arabicName: json['arabicName'] as String,
      englishName: json['englishName'] as String?,
      password1: json['password1'] as String?,
      password2: json['password2'] as String?,
      mainContact1: json['mainContact1'] as String?,
      isUser: json['isUser'],
      buildingNo: json['buildingNo'] as num?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'personNumber': instance.personNumber,
      'email': instance.email,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
      'password1': instance.password1,
      'password2': instance.password2,
      'mainContact1': instance.mainContact1,
      'isUser': instance.isUser,
      'buildingNo': instance.buildingNo,
    };
