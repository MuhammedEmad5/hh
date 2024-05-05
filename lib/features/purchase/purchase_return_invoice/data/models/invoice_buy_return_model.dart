import 'package:InvoiceF/core/model/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_buy_return_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceBuyReturn implements JsonModel {
  int VendorId;
  num buildingNo; //1
  int invoiceNo;
  String userNumber;
  int? Inv_billTypeNo;
  int Inv_invoiceNo;
  num Inv_buildingNo;
  String? Inv_userNumber;
  int billTypeNo; // 33
  num storeNo; // 1
  String aName; // زبون عادي
  String eName; // Normal Customer
  dynamic isCash;
  String? dateG; // 2024-03-29 17:41:08.537
  String? dateH; // 14450920
  dynamic isDelivered;
  num shipCost;
  num billToBuildingNo; // 1
  dynamic isInventory1GaveIt;
  dynamic isInventory2ReceivedIt;
  dynamic isPostedStock;
  dynamic isDeleted;
  dynamic isVoid;
  dynamic isPosted;
  dynamic isGLPosted;
  dynamic isDeposited;
  dynamic isCleared;
  num amountLeftAfterAllBills;
  num collectedAmountFromOtherBills;
  String? note;
  dynamic isItemOrUnit;
  dynamic isUseInOutInvoice;
  dynamic isAccountingForOthers;
  int personNo; // 1
  String? telephone;
  num sumPayed;
  num subTotal;
  num subTotalDiscount;
  num subNetTotal;
  num subNetTotalPlusTax;
  int subCount;
  num subLeftQuantity;
  num subQuantity;
  num amountCalculated;
  num discount;
  num totalDiscount;
  num amountLeft;
  num amountCalculatedPayed;
  dynamic isCompleted;
  num taxRate1_Percentage;
  num taxRate2_Percentage;
  dynamic isCalculateTax2OnTax1;
  dynamic isTax1OnShipping;
  dynamic isTax2OnShipping;
  num taxRate1_Total;
  num taxRate2_Total;
  dynamic isOneInvoiceUploaded;
  num cashRegisterNo_BuildingNo; // 1
  String? invoiceVATID;
  num? clientVendorNo;
  dynamic isUploadedToMainBranch;
  dynamic isPostedToTransactions;
  String? dateG_PerDay; /////////////
  int dateG_PerMonth;
  int dateG_PerYearQuarter;
  int dateG_PerYearHalf;
  int dateG_PerYear;
  int VATTypeNo; // 1
  int VATGroupNo; // 1
  int print_numOfCopies;
  num runningCostAvgTotal;
  num buyPrice_costPriceTotal;
  num primaryUnit_QuantityTotal;
  String? paperBillNum;
  dynamic isReturnedFullyByReturnInvoice;
  num weightTotal;
  num subNetTotal_ExecludingTax;
  num amountPayed;
  String gaztInvoiceNumber; // 1/79 (1/X)
  String gaztUniqueInvoiceIdentifier; // 2b429c0a-04c6-4fec-8372-6785d2602279
  int gaztInvoiceTypeCode; // 388
  int linesCount;
  dynamic isAgentGivenHisMoney;

// 		row_timestamp
// 		0x000000000009304B

  InvoiceBuyReturn({
    this.VendorId = 0,
    this.buildingNo = 1,
    this.invoiceNo = 0,
    this.userNumber = '0',
    this.Inv_billTypeNo,
    this.Inv_invoiceNo = 0,
    this.Inv_buildingNo = 0,
    this.Inv_userNumber,
    this.billTypeNo = 33,
    this.storeNo = 1,
    this.aName = "زبون عادي",
    this.eName = "Normal Customer",
    this.isCash = 0,
    this.dateG = '2024-03-29 17:41:08.537',
    this.dateH = '14450920',
    this.isDelivered = 0,
    this.shipCost = 0.0,
    this.billToBuildingNo = 1,
    this.isInventory1GaveIt = 0,
    this.isInventory2ReceivedIt = 0,
    this.isPostedStock = 0,
    this.isDeleted = 0,
    this.isVoid = 0,
    this.isPosted = 0,
    this.isGLPosted = 0,
    this.isDeposited = 0,
    this.isCleared = 0,
    this.amountLeftAfterAllBills = 0.0,
    this.collectedAmountFromOtherBills = 0.0,
    this.note = "",
    this.isItemOrUnit = 0,
    this.isUseInOutInvoice = 0,
    this.isAccountingForOthers = 0,
    this.personNo = 1,
    this.telephone,
    this.sumPayed = 0.0,
    this.subTotal = 0.0,
    this.subTotalDiscount = 0.0,
    this.subNetTotal = 0.0,
    this.subNetTotalPlusTax = 0.0,
    this.subCount = 0,
    this.subLeftQuantity = 0.0,
    this.subQuantity = 0.0,
    this.amountCalculated = 0.0,
    this.discount = 0.0,
    this.totalDiscount = 0.0,
    this.amountLeft = 0.0,
    this.amountCalculatedPayed = 0.0,
    this.isCompleted = 0,
    this.taxRate1_Percentage = 0.0,
    this.taxRate2_Percentage = 0.0,
    this.isCalculateTax2OnTax1 = 0,
    this.isTax1OnShipping = 0,
    this.isTax2OnShipping = 0,
    this.taxRate1_Total = 0.0,
    this.taxRate2_Total = 0.0,
    this.isOneInvoiceUploaded = 0,
    this.cashRegisterNo_BuildingNo = 1,
    this.invoiceVATID,
    this.clientVendorNo,
    this.isUploadedToMainBranch = 0,
    this.isPostedToTransactions = 0,
    this.dateG_PerDay,
    this.dateG_PerMonth = 0,
    this.dateG_PerYearQuarter = 0,
    this.dateG_PerYearHalf = 0,
    this.dateG_PerYear = 0,
    this.VATTypeNo = 1,
    this.VATGroupNo = 1,
    this.print_numOfCopies = 0,
    this.runningCostAvgTotal = 0.0,
    this.buyPrice_costPriceTotal = 0.0,
    this.primaryUnit_QuantityTotal = 0.0,
    this.paperBillNum,
    this.isReturnedFullyByReturnInvoice = 0,
    this.weightTotal = 0.0,
    this.subNetTotal_ExecludingTax = 0.0,
    this.amountPayed = 0.0,
    this.gaztInvoiceNumber = '1/1',
    this.gaztUniqueInvoiceIdentifier = "2b429c0a-04c6-4fec-8372-6785d2602279",
    this.gaztInvoiceTypeCode = 388,
    this.linesCount = 0,
    this.isAgentGivenHisMoney = 0,
  });

  @override
  factory InvoiceBuyReturn.fromJson(Map<String, dynamic> json) =>
      _$InvoiceBuyReturnFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceBuyReturnToJson(this);
}
