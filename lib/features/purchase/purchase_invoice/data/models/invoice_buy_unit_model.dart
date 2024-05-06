import 'package:InvoiceF/core/model/json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_buy_unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceBuyUnit implements JsonModel {
  int invoiceNo;
  num buildingNo;
  int VendorId;
  int orderNo;
  num itemNo;
  int unitNo;
  String aName;
  String eName;
  num quantity;
  num price;
  num discount;
  num discountPercent;
  num discountTotal;
  num total;
  num taxRate1_Percentage;
  num taxRate1_Total;
  num totalPlusTax;
  num buyPrice_costPrice;
  num buyPrice_costPrice2;
  num profitMarginTotal;
  int primaryUnit_SelectedUnitOrder;
  num primaryUnit_Quantity;
  num primaryUnit_ConvertionMultiple;
  num primaryUnit_ConvertionAddition;
  num itemUnitLeastPriceAtThisTime;
  dynamic isPosted;
  dynamic isGLPosted;
  dynamic isPrint;
  int? lineTypeNo;
  num? projectNo;
  num? accountNo;
  String barCode;
  num? costAccountNo;
  num cost;
  num quantityFinished;
  String? expirationDateG;
  int? storeTransactionNo;
  dynamic isServiceCompleted;
  int? taxCodeNo;
  num taxRate2_Percentage;
  int? taxRateNo2;
  num taxRate2_Total;
  dynamic isOneInvoiceUploaded;
  int? taxRateNo;
  num storeNo;
  num itemCategoryNo;
  num itemClassificationTreeNo;
  num itemLocationNo;
  num itemDepartmentNo;
  int print_numOfCopies;
  String itemModel;
  num store_QuantityBeforePost;
  num addsQuantity;
  num addsWeight;
  num quantityReturned;
  dynamic isReturnedFully;
  num quantityRemaining;
  num itemSize;
  String insuranceTime;
  String insuranceNote;
  String serialNo;
  String serialNo2;
  num buyPrice2;
  int? importOrderNo;
  dynamic isPauseExpiry;
  String pauseExpiryDateG;
  int pauseDays;
  int pauseNumberOfTimesTillNow;
  int totalPausedDaysTillNow;
  int price_selectedNo; // 1
  num price_differenceFromFirstPrice;
  num price_differenceFromFirstPriceTotal;
  num runningCostAvg;
  num runningCostAvg_perCurrentUnit;
  num runningCostAvg_diffrenceWhithPrice;
  num runningCostAvg_diffrenceWhithPriceTotal;
  num profitMarginTotal_fromAvgCost;
  num? discountMultiplicationTypeNo;
  String note;
  num runningCostAvgTotal;
  num buyPrice_costPriceTotal;
  dynamic isSourceOfContent;
  num weight;
  num weightTotal;
  String? deliveryDate;
  String? deliveryDateH;
  String? rentDate;
  String? rentReturnDate;
  dynamic isFixed;
  dynamic isSpot;
  int? starchNo;
  int? blueWeightNo;
  dynamic isHangerOrFold;
  int? merzamTypeNo;
  dynamic isLost;
  num dateDifferenceInDays;
  String lineEntered_Date;
  int lineEntered_personNo; //1
  int uiSource = 0;

  InvoiceBuyUnit({
    this.invoiceNo = 0,
    this.buildingNo = 0,
    this.VendorId = 0,
    this.orderNo = 0,
    this.itemNo = 0,
    this.unitNo = 0,
    required this.aName,
    required this.eName,
    this.quantity = 0,
    this.price = 0,
    this.discount = 0,
    this.discountPercent = 0,
    this.discountTotal = 0,
    this.total = 0,
    this.taxRate1_Percentage = 0,
    this.taxRate1_Total = 0,
    this.totalPlusTax = 0,
    this.buyPrice_costPrice = 0,
    this.buyPrice_costPrice2 = 0,
    this.profitMarginTotal = 0,
    this.primaryUnit_SelectedUnitOrder = 0,
    this.primaryUnit_Quantity = 0,
    this.primaryUnit_ConvertionMultiple = 0,
    this.primaryUnit_ConvertionAddition = 0,
    this.itemUnitLeastPriceAtThisTime = 0,
    this.isPosted = 0,
    this.isGLPosted = 0,
    this.isPrint = 0,
    this.lineTypeNo = 0,
    this.projectNo = 0,
    this.accountNo = 0,
    this.barCode = '',
    this.costAccountNo = 0,
    this.cost = 0,
    this.quantityFinished = 0,
    this.expirationDateG = '',
    this.storeTransactionNo = 0,
    this.isServiceCompleted = 0,
    this.taxCodeNo = 0,
    this.taxRate2_Percentage = 0,
    this.taxRateNo2 = 0,
    this.taxRate2_Total = 0,
    this.isOneInvoiceUploaded = 0,
    this.taxRateNo = 0,
    this.storeNo = 0,
    this.itemCategoryNo = 0,
    this.itemClassificationTreeNo = 0,
    this.itemLocationNo = 0,
    this.itemDepartmentNo = 0,
    this.itemModel = '',
    this.store_QuantityBeforePost = 0,
    this.addsQuantity = 0,
    this.addsWeight = 0,
    this.quantityReturned = 0,
    this.isReturnedFully = 0,
    this.quantityRemaining = 0,
    this.itemSize = 0,
    this.insuranceTime = '',
    this.insuranceNote = '',
    this.serialNo = '',
    this.serialNo2 = '',
    this.buyPrice2 = 0,
    this.importOrderNo = 0,
    this.isPauseExpiry = 0,
    this.pauseExpiryDateG = '',
    this.pauseDays = 0,
    this.pauseNumberOfTimesTillNow = 0,
    this.totalPausedDaysTillNow = 0,
    this.price_selectedNo = 0,
    this.price_differenceFromFirstPrice = 0,
    this.price_differenceFromFirstPriceTotal = 0,
    this.runningCostAvg = 0,
    this.runningCostAvg_perCurrentUnit = 0,
    this.runningCostAvg_diffrenceWhithPrice = 0,
    this.runningCostAvg_diffrenceWhithPriceTotal = 0,
    this.profitMarginTotal_fromAvgCost = 0,
    this.discountMultiplicationTypeNo = 0,
    this.note = '',
    this.runningCostAvgTotal = 0,
    this.buyPrice_costPriceTotal = 0,
    this.isSourceOfContent = 0,
    this.weight = 0,
    this.weightTotal = 0,
    this.deliveryDate = '',
    this.deliveryDateH = '',
    this.rentDate = '',
    this.rentReturnDate = '',
    this.isFixed = 0,
    this.isSpot = 0,
    this.starchNo = 0,
    this.blueWeightNo = 0,
    this.isHangerOrFold = 0,
    this.merzamTypeNo = 0,
    this.isLost = 0,
    this.dateDifferenceInDays = 0,
    this.lineEntered_Date = '',
    this.lineEntered_personNo = 0,
    this.uiSource = 0,
    this.print_numOfCopies = 0,
  });

  @override
  factory InvoiceBuyUnit.fromJson(Map<String, dynamic> json) =>
      _$InvoiceBuyUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvoiceBuyUnitToJson(this);
}
