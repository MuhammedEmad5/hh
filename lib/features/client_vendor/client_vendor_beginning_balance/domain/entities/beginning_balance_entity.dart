import 'package:InvoiceF_ClientVendor/core/model/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beginning_balance_entity.g.dart';

@JsonSerializable()
class BeginningBalanceEntity {
  int branchNumber;
  int clientVendorNumber;
  int transactionNumber;
  String arabicName;
  String? englishName;
  String? originalPaperBillNumber;
  String? invoiceVatId;
  String date;
  double debit;
  double credit;
  double balance;
  String?  note;



  BeginningBalanceEntity({
    required this.branchNumber,
    required this.clientVendorNumber,
    required this.transactionNumber,
    required this.arabicName,
    this.englishName,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.date,
    this.originalPaperBillNumber,
    this.invoiceVatId,
    this.note


  });

  @override
  factory BeginningBalanceEntity.fromJson(Map<String, dynamic> json) =>
      _$BeginningBalanceEntityFromJson(json);


  Map<String, dynamic> toJson() => _$BeginningBalanceEntityToJson(this);




}
