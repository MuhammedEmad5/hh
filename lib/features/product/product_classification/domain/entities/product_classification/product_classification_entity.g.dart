// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_classification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductClassification _$ProductClassificationFromJson(
        Map<String, dynamic> json) =>
    ProductClassification(
      productClassification: json['productClassification'] as num,
      parent: json['parent'] as num?,
      arabicName: json['arabicName'] as String?,
      englishName: json['englishName'] as String?,
    );

Map<String, dynamic> _$ProductClassificationToJson(
        ProductClassification instance) =>
    <String, dynamic>{
      'productClassification': instance.productClassification,
      'parent': instance.parent,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
    };
