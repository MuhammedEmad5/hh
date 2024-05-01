import 'package:InvoiceF_Sales/core/model/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_sell_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceSell implements JsonModel {
  final int VendorId;
  final num buildingNo; //1
  final int invoiceNo;
  final String userNumber;
  final int billTypeNo; // 33
  final int storeNo; // 1
  final String aName; // زبون عادي
  final String eName; // Normal Customer
  final dynamic isCash;
  final String? dateG; // 2024-03-29 17:41:08.537
  final String? dateH; // 14450920
  final dynamic isDelivered;
  final dynamic isOutDelivery;
  final num shipCost;
  final num billToBuildingNo; // 1
  final dynamic isInventory1GaveIt;
  final dynamic isInventory2ReceivedIt;
  final dynamic isPostedStock;
  final dynamic isDeleted;
  final dynamic isVoid;
  final dynamic isPosted;
  final dynamic isGLPosted;
  final dynamic isPayments;
  final dynamic isFastInvoice;
  final dynamic isDeposited;
  final dynamic isCleared;
  final num amountLeftAfterAllBills;
  final num collectedAmountFromOtherBills;
  final String? note;
  final dynamic isItemOrUnit;
  final dynamic isUseInOutInvoice;
  final dynamic isAccountingForOthers;
  final int personNo; // 1
  final String? telephone;
  final num sumPayed;
  final num subTotal;
  final num subTotalDiscount;
  final num subNetTotal;
  final num subNetTotalPlusTax;
  final int subCount;
  final num subLeftQuantity;
  final num subQuantity;
  final num amountCalculated;
  final num discount;
  final num totalDiscount;
  final num amountPayed01;
  final num amountPayed02;
  final num amountPayed03;
  final num amountPayed04;
  final num amountPayed05;
  final num amountLeft;
  final num amountCalculatedPayed;
  final dynamic isCompleted;
  final num taxRate1_Percentage;
  final num taxRate2_Percentage;
  final dynamic isCalculateTax2OnTax1;
  final dynamic isTax1OnShipping;
  final dynamic isTax2OnShipping;
  final num taxRate1_Total;
  final num taxRate2_Total;
  final dynamic isOneInvoiceUploaded;
  final num cashRegisterNo_BuildingNo; // 1
  final String? invoiceVATID;
  final num? clientVendorNo;
  final dynamic isUploadedToMainBranch;
  final dynamic isPostedToTransactions;
  final String? dateG_PerDay; /////////////
  final int dateG_PerMonth;
  final int dateG_PerYearQuarter;
  final int dateG_PerYearHalf;
  final int dateG_PerYear;
  final int VATTypeNo; // 1
  final int VATGroupNo; // 1
  final num profitMarginTotal;
  final num customerCashGiven;
  final num customerCashReturned;
  final num price_differenceFromFirstPriceTotal;
  final int print_numOfCopies;
  final dynamic isPrintPartial;
  final num cardAmount_Visa;
  final num cardAmount_SPAN;
  final num runningCostAvg_diffrenceWhithPriceTotal;
  final num profitMarginTotal_fromAvgCost;
  final num runningCostAvgTotal;
  final num buyPrice_costPriceTotal;
  final num primaryUnit_QuantityTotal;
  final String? paperBillNum;
  final dynamic isReturnedFullyByReturnInvoice;
  final num weightTotal;
  final num subNetTotal_ExecludingTax;
  final num device_mileage;
  final num device_next_mileage;
  final int Inv_billTypeNo; // 1
  final num calculatedPayed;
  final num amountPayed;
  final num calculatedCreditAmount;
  final num calculatedDebitAmount;
  final dynamic isCreateGlass;
  final num rentQuantity;
  final dynamic isHangerOrFold;
  final dynamic isSpot;
  final dynamic isFastCleaning;
  final dynamic isLost;
  final dynamic isPaperInvoiceReturned;
  final num trainingHourseToBeGiven;
  final num trainingHourseLeft;
  final String gaztInvoiceNumber; // 1/79 (1/X)
  final String
      gaztUniqueInvoiceIdentifier; // 2b429c0a-04c6-4fec-8372-6785d2602279
  final int gaztInvoiceTypeCode; // 388
  final int linesCount;
  final dynamic isAgentGivenHisMoney;

// 		row_timestamp
// 		0x000000000009304B

  InvoiceSell({
    this.VendorId = 0,
    this.buildingNo = 1,
    this.invoiceNo = 0,
    this.userNumber = '0',
    this.billTypeNo = 33,
    this.storeNo = 1,
    this.aName = "زبون عادي",
    this.eName = "Normal Customer",
    this.isCash = 0,
    this.dateG = '2024-03-29 17:41:08.537',
    this.dateH = '14450920',
    this.isDelivered = 0,
    this.isOutDelivery = 0,
    this.shipCost = 0.0,
    this.billToBuildingNo = 1,
    this.isInventory1GaveIt = 0,
    this.isInventory2ReceivedIt = 0,
    this.isPostedStock = 0,
    this.isDeleted = 0,
    this.isVoid = 0,
    this.isPosted = 0,
    this.isGLPosted = 0,
    this.isPayments = 0,
    this.isFastInvoice = 0,
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
    this.amountPayed01 = 0.0,
    this.amountPayed02 = 0.0,
    this.amountPayed03 = 0.0,
    this.amountPayed04 = 0.0,
    this.amountPayed05 = 0.0,
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
    this.profitMarginTotal = 0.0,
    this.customerCashGiven = 0.0,
    this.customerCashReturned = 0.0,
    this.price_differenceFromFirstPriceTotal = 0.0,
    this.print_numOfCopies = 0,
    this.isPrintPartial = 0,
    this.cardAmount_Visa = 0.0,
    this.cardAmount_SPAN = 0.0,
    this.runningCostAvg_diffrenceWhithPriceTotal = 0.0,
    this.profitMarginTotal_fromAvgCost = 0.0,
    this.runningCostAvgTotal = 0.0,
    this.buyPrice_costPriceTotal = 0.0,
    this.primaryUnit_QuantityTotal = 0.0,
    this.paperBillNum,
    this.isReturnedFullyByReturnInvoice = 0,
    this.weightTotal = 0.0,
    this.subNetTotal_ExecludingTax = 0.0,
    this.device_mileage = 0.0,
    this.device_next_mileage = 0.0,
    this.Inv_billTypeNo = 0,
    this.calculatedPayed = 0.0,
    this.amountPayed = 0.0,
    this.calculatedCreditAmount = 0.0,
    this.calculatedDebitAmount = 0.0,
    this.isCreateGlass = 0,
    this.rentQuantity = 0.0,
    this.isHangerOrFold = 0,
    this.isSpot = 0,
    this.isFastCleaning = 0,
    this.isLost = 0,
    this.isPaperInvoiceReturned = 0,
    this.trainingHourseToBeGiven = 0.0,
    this.trainingHourseLeft = 0.0,
    this.gaztInvoiceNumber = '0',
    this.gaztUniqueInvoiceIdentifier = "2b429c0a-04c6-4fec-8372-6785d2602279",
    this.gaztInvoiceTypeCode = 388,
    this.linesCount = 0,
    this.isAgentGivenHisMoney = 0,
  });

  @override
  factory InvoiceSell.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSellFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceSellToJson(this);
}
