import 'package:InvoiceF/core/model/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_vendor_beginning_balance_model.g.dart';


@JsonSerializable()
class ClientVendorBeginningBalance extends JsonModel {
  int VendorId;
  int buildingNo;
  int transactionNo;
  int clientVendorNo;
  String aName;
  String? eName;
  String dateG;
  String? dateH;
  double debit;
  double credit;
  double balance;
  dynamic orderNo;
  dynamic isPosted;
  String? note;
  dynamic isGLPosted;
  dynamic isVoid;
  dynamic isCleared;
  int? billTypeNo;
  int? manPosted;
  int? manGLPosted;
  int? manVoid;
  String? dateG_PerDay;
  int? dateG_PerMonth;
  int? dateG_PerYearQuarter;
  int? dateG_PerYearHalf;
  int? dateG_PerYear;
  String? dateG_Posted;
  dynamic dateG_GLPosted;
  int? personNo;
  dynamic isPostedToTransactions;
  String? invoiceVATID;
  String? paperBillNum;
  int? print_numOfCopies;
  dynamic print_DateG;
  int? staffNo1_personNo;
  int? staffNo2_personNo;
  int? staffNo3_personNo;
  int? inventory1StaffNo;
  int? inventory2StaffNo;
  int? personNo2;
  int? driverNo;
  int? agentNo;
  dynamic uiSource;
  dynamic billTypeNo_Second;

  ClientVendorBeginningBalance({
     this.VendorId = 0,
    required this.buildingNo,
    required this.transactionNo,
    required this.clientVendorNo,
    required this.aName,
    this.eName,
    required this.dateG,
    this.dateH,
    required this.debit,
    required this.credit,
    required this.balance,
    this.orderNo,
    this.isPosted,
    this.note,
    this.isGLPosted,
    this.isVoid,
    this.isCleared,
    this.billTypeNo,
    this.manPosted,
    this.manGLPosted,
    this.manVoid,
    this.dateG_PerDay,
    this.dateG_PerMonth,
    this.dateG_PerYearQuarter,
    this.dateG_PerYearHalf,
    this.dateG_PerYear,
    this.dateG_Posted,
    this.dateG_GLPosted,
    this.personNo,
    this.isPostedToTransactions,
    this.invoiceVATID,
    this.paperBillNum,
    this.print_numOfCopies,
    this.print_DateG,
    this.staffNo1_personNo,
    this.staffNo2_personNo,
    this.staffNo3_personNo,
    this.inventory1StaffNo,
    this.inventory2StaffNo,
    this.personNo2,
    this.driverNo,
    this.agentNo,
    this.uiSource,
    this.billTypeNo_Second,
  });


  @override
  factory ClientVendorBeginningBalance.fromJson(Map<String, dynamic> json) =>
      _$ClientVendorBeginningBalanceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClientVendorBeginningBalanceToJson(this);


}
