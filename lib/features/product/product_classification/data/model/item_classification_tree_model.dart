import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../core/model/json_model.dart';

part 'item_classification_tree_model.g.dart';

@JsonSerializable()
class ItemClassificationTree implements JsonModel {
  int VendorId;
  num itemClassificationTreeNo;
  num? parentNo;
  String? userNumber;
  int depthNum;
  String? aName;
  String? eName;
  String? aDescription;
  String? eDescription;
  double maxBalanceAllowed;
  double minBalanceAllowed;
  double warnMinBalance;
  double warnMaxBalance;
  dynamic isLeaf;
  dynamic isDisabled;
  dynamic isCanDelete;
  dynamic isCanMove;
  dynamic isCanAdd;
  int? typeNo;
  int? subTypeNo;
  int? statusNo;
  int? nature;
  String? note;
  dynamic isPosted;
  dynamic isDeleted;
  String? deletedDate;
  String? disabledDate;
  int? appImageNo;
  String? printerCodeName;
  // RowTimestamp? rowTimestamp;

  ItemClassificationTree({
    this.VendorId = 0,
    required this.itemClassificationTreeNo,
    this.parentNo,
    String? userNumber,
    this.depthNum = 0,
    String? aName,
    String? eName,
    this.aDescription,
    this.eDescription,
    this.maxBalanceAllowed = 0.000000,
    this.minBalanceAllowed = 0.000000,
    this.warnMinBalance = 0.000000,
    this.warnMaxBalance = 0.000000,
    this.isLeaf = 0,
    this.isDisabled = 0,
    this.isCanDelete = 0,
    this.isCanMove = 0,
    this.isCanAdd = 0,
    this.typeNo,
    this.subTypeNo,
    this.statusNo,
    this.nature,
    this.note,
    this.isPosted = 0,
    this.isDeleted = 0,
    this.deletedDate,
    this.disabledDate,
    this.appImageNo,
    this.printerCodeName,
    //this.rowTimestamp,
  })  : userNumber =  userNumber ?? itemClassificationTreeNo.toString(),
        aName = aName ?? "تصنيف جديد",
        eName = eName ?? "New Item Classification";


  @override
  factory ItemClassificationTree.fromJson(Map<String, dynamic> json) =>
      _$ItemClassificationTreeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ItemClassificationTreeToJson(this);
}
