import 'package:InvoiceF/core/model/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'met_theme.g.dart';


@JsonSerializable()

class Met_Theme implements JsonModel {
  int themeNo;
  int? parentNo;
  String? userNumber;
  String codeName;
  String? aName;
  String? eName;
  dynamic aDescription;
  dynamic eDescription;
  int? accountNo;
  int? maxBalanceAllowed;
  int? minBalanceAllowed;
  int? warnMinBalance;
  int? warnMaxBalance;
  dynamic isLeaf;
  dynamic isDisabled;
 dynamic isCanDelete;
 dynamic isCanMove;
 dynamic isCanAdd;
 dynamic isDeleted;
  int? depthNum;
  int? typeNo;
  int? subTypeNo;
  int? statusNo;
  int? nature;
  dynamic note;
  int? horizontalTreeNo;
  dynamic isVisible;
  dynamic isVisibleAtUsersView;
  dynamic isLanguageApplied;

  Met_Theme({
    required this.themeNo,
    this.parentNo,
    this.userNumber,
    required this.codeName,
    this.aName,
    this.eName,
    this.aDescription,
    this.eDescription,
    this.accountNo,
    this.maxBalanceAllowed,
    this.minBalanceAllowed,
    this.warnMinBalance,
    this.warnMaxBalance,
    this.isLeaf,
    this.isDisabled,
    this.isCanDelete,
    this.isCanMove,
    this.isCanAdd,
    this.isDeleted,
    this.depthNum,
    this.typeNo,
    this.subTypeNo,
    this.statusNo,
    this.nature,
    this.note,
    this.horizontalTreeNo,
    this.isVisible,
    this.isVisibleAtUsersView,
    this.isLanguageApplied,
  });


  @override
  factory Met_Theme.fromJson(Map<String, dynamic> json) =>
      _$Met_ThemeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$Met_ThemeToJson(this);

}

