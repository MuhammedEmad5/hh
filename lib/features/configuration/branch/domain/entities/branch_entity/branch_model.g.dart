// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      branchNumber: json['branchNumber'] as num,
      customerNumber: json['customerNumber'] as String?,
      arabicName: json['arabicName'] as String,
      arabicDescription: json['arabicDescription'] as String?,
      englishName: json['englishName'] as String?,
      englishDescription: json['englishDescription'] as String?,
      note: json['note'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'branchNumber': instance.branchNumber,
      'customerNumber': instance.customerNumber,
      'arabicName': instance.arabicName,
      'arabicDescription': instance.arabicDescription,
      'englishName': instance.englishName,
      'englishDescription': instance.englishDescription,
      'note': instance.note,
      'address': instance.address,
    };
