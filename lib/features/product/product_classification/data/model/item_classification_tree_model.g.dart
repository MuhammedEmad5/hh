// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_classification_tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemClassificationTree _$ItemClassificationTreeFromJson(
        Map<String, dynamic> json) =>
    ItemClassificationTree(
      VendorId: (json['VendorId'] as num?)?.toInt() ?? 0,
      itemClassificationTreeNo: json['itemClassificationTreeNo'] as num,
      parentNo: json['parentNo'] as num?,
      userNumber: json['userNumber'] as String?,
      depthNum: (json['depthNum'] as num?)?.toInt() ?? 0,
      aName: json['aName'] as String?,
      eName: json['eName'] as String?,
      aDescription: json['aDescription'] as String?,
      eDescription: json['eDescription'] as String?,
      maxBalanceAllowed: (json['maxBalanceAllowed'] as num?)?.toDouble() ?? 0.0,
      minBalanceAllowed: (json['minBalanceAllowed'] as num?)?.toDouble() ?? 0.0,
      warnMinBalance: (json['warnMinBalance'] as num?)?.toDouble() ?? 0.0,
      warnMaxBalance: (json['warnMaxBalance'] as num?)?.toDouble() ?? 0.0,
      isLeaf: json['isLeaf'] ?? 0,
      isDisabled: json['isDisabled'] ?? 0,
      isCanDelete: json['isCanDelete'] ?? 0,
      isCanMove: json['isCanMove'] ?? 0,
      isCanAdd: json['isCanAdd'] ?? 0,
      typeNo: (json['typeNo'] as num?)?.toInt(),
      subTypeNo: (json['subTypeNo'] as num?)?.toInt(),
      statusNo: (json['statusNo'] as num?)?.toInt(),
      nature: (json['nature'] as num?)?.toInt(),
      note: json['note'] as String?,
      isPosted: json['isPosted'] ?? 0,
      isDeleted: json['isDeleted'] ?? 0,
      deletedDate: json['deletedDate'] as String?,
      disabledDate: json['disabledDate'] as String?,
      appImageNo: (json['appImageNo'] as num?)?.toInt(),
      printerCodeName: json['printerCodeName'] as String?,
    );

Map<String, dynamic> _$ItemClassificationTreeToJson(
        ItemClassificationTree instance) =>
    <String, dynamic>{
      'VendorId': instance.VendorId,
      'itemClassificationTreeNo': instance.itemClassificationTreeNo,
      'parentNo': instance.parentNo,
      'userNumber': instance.userNumber,
      'depthNum': instance.depthNum,
      'aName': instance.aName,
      'eName': instance.eName,
      'aDescription': instance.aDescription,
      'eDescription': instance.eDescription,
      'maxBalanceAllowed': instance.maxBalanceAllowed,
      'minBalanceAllowed': instance.minBalanceAllowed,
      'warnMinBalance': instance.warnMinBalance,
      'warnMaxBalance': instance.warnMaxBalance,
      'isLeaf': instance.isLeaf,
      'isDisabled': instance.isDisabled,
      'isCanDelete': instance.isCanDelete,
      'isCanMove': instance.isCanMove,
      'isCanAdd': instance.isCanAdd,
      'typeNo': instance.typeNo,
      'subTypeNo': instance.subTypeNo,
      'statusNo': instance.statusNo,
      'nature': instance.nature,
      'note': instance.note,
      'isPosted': instance.isPosted,
      'isDeleted': instance.isDeleted,
      'deletedDate': instance.deletedDate,
      'disabledDate': instance.disabledDate,
      'appImageNo': instance.appImageNo,
      'printerCodeName': instance.printerCodeName,
    };
