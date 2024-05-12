

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/model/json_model.dart';

part 'bank_account.g.dart';


@JsonSerializable()
class BankAccount extends JsonModel {
  int VendorId;
  int bankAccountNo;
  int? parentNo;
  String userNumber;
  int? depthNum;
  String aName;
  String? eName;
  String? aDescription;
  String? eDescription;
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
  int? typeNo;
  int? subTypeNo;
  int? statusNo;
  int? nature;
  dynamic note;
  double? credit;
  int? debit;
  String? creditDebitDateTime;
  dynamic openDate;
  int? ownerType;
  String? ownerReferenceNo;
  dynamic deletedDate;
  dynamic disabledDate;
  int? fileNo;
  int? horizontalTreeNo;
  dynamic barCode;
  DateTime? openBalanceDate;
  DateTime? dateG;
  DateTime? currentBalanceDateG;
  int? currentBalance;
  int? manPostedOpenBalance;
  int? openBalance;
  int? manPostedLastBalance;

  BankAccount({
    this.VendorId = 0,
   required this.bankAccountNo,
    this.parentNo,
    required this.userNumber,
    this.depthNum,
    required this.aName,
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
    this.typeNo,
    this.subTypeNo,
    this.statusNo,
    this.nature,
    this.note,
    this.credit,
    this.debit,
    this.creditDebitDateTime,
    this.openDate,
    this.ownerType,
    this.ownerReferenceNo,
    this.deletedDate,
    this.disabledDate,
    this.fileNo,
    this.horizontalTreeNo,
    this.barCode,
    this.openBalanceDate,
    this.dateG,
    this.currentBalanceDateG,
    this.currentBalance,
    this.manPostedOpenBalance,
    this.openBalance,
    this.manPostedLastBalance,
  });

  @override
  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BankAccountToJson(this);


}


