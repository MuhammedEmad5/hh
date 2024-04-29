import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/model/business_model.dart';

part 'item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Item implements BusinessModel {
  int VendorId;
  num itemNo;
  num? parentNo;
  String userNumber;
  String aName;
  String eName;
  num itemClassificationTreeNo;
  num itemCategoryNo;
  num? itemLocationNo;
  String barCode;
  num buyPrice;
  num sellPrice;
  num sellPrice2;
  num sellPrice3;
  num sellPrice4;
  num leastSellPrice;
  num taxPercent;
  num taxAmount;
  num firstStockQuantity;
  int? unitNo_defaultSell;
  int unitNo_defaultStore;
  int unitNo_defaultBuy;
  String? serialNo;
  String? serialNo2;
  String? serialNo3;
  dynamic isSellable;
  dynamic IsPurchasable;
  String dateIntroduced;
  num? horizontalTreeNo;
  int depthNum;
  String? thirdName;
  String? aDescription;
  String? eDescription;
  String? thirdDescription;
  String? sizeName;
  num capacity;
  dynamic isAssembly;
  dynamic isJob;
  dynamic isLeaf;
  dynamic isDisabled;
  String? disabledDate;
  dynamic isCanDelete;
  dynamic isCanMove;
  dynamic isCanAdd;
  int typeNo; // 725
  dynamic isDeleted;
  String? deletedDate;
  int? subTypeNo;
  int statusNo;
  int? nature;
  int usedType; // 735
  int? color;
  String? note;
  dynamic isAllow_Discount;
  String? expirationDateG;
  int? priceLevel;
  int? costMethod;
  int? countryNo;
  String? companyNo;
  int buySellTypeNo;
  String? contentInfo;
  num? fileNo;
  num? accountNo;
  num? accountNo_Second;
  num itemDepartmentNo;
  num? accountNo_Third;
  num leastStock;
  num preferredStock;
  num maxQuantityStock;
  num defaultBuyQuantity;
  num? clientVendorNo;
  num? clientVendorNo2;
  num? clientVendorNo3;
  num? clientVendorNo4;
  num leastStock_Percentage;
  num preferredStock_Percentage;
  num maxStock_Percentage;
  int? sellPrice_Type;
  int? stockLimit_Type;
  int? dealQuantity_Type;
  num dealQuantity;
  dynamic isDisAllow_MoreThanDealQuantity;
  num sellPrice_Deal;
  num leastSellPrice_Deal;
  num discount_Deal;
  num sellPrice_Percentage_Deal;
  num leastSellPrice_Percentage_Deal;
  num reOrderQuantity;
  num discountTotal_Deal;
  int? barCode_Type;
  String? barCode_Shape;
  num size_Length;
  num size_Width;
  num size_Height;
  dynamic isTaxable;
  int? taxRateNo;
  int? taxTypeNo;
  int? taxClassNo;
  dynamic tax_isUseSeparateFieldsForTax;
  num taxPurchasePercent;
  num taxPurchaseAmount;
  dynamic isOneInvoiceUploaded;
  num? appImageNo;
  int source_PriceFrom;
  dynamic source_isUsedAsSource;
  num? source_itemNo;
  String? itemModel;
  String? supplierName1;
  String? supplierName2;
  int unitNo_SaleDefaultUnitOrder;
  int unitNo_BuyDefaultUnitOrder;
  String? barCode2;
  num buyPrice2;
  num maxBuyPricePercentage;
  num maxBuyPrice;
  num leastSellPricePercentage;
  num discount;
  num discount_Percentage;
  num discountTotal;
  dynamic isApplySellIncreasePercentage;
  dynamic isApplySellIncreasePercentage2;
  dynamic isApplySellIncreasePercentage3;
  dynamic isApplySellIncreasePercentage4;
  dynamic isApplyLeastSellPricePercentage;
  num sellIncreasePercentage;
  num sellIncreasePercentage2;
  num sellIncreasePercentage3;
  num sellIncreasePercentage4;
  dynamic sellPrice_isTaxIncluded;
  num sellPrice_Percentage;
  num leastSellPrice_Percentage;
  num cost;
  num additionalCost;
  num sellPriceFinal1;
  num sellPriceFinal2;
  num sellPriceFinal3;
  num sellPriceFinal4;
  num sellPriceFinal5;
  dynamic weight_isUseInCalculation;
  num size_Weight;
  num profitMarginTotal;
  num profitMarginTotal2;
  num profitMarginTotal3;
  num profitMarginTotal4;
  int unit02_unitNo_defaultSell;
  String? unit02_barCode;
  String? unit02_barCode2;
  num unit02_buyPrice;
  num unit02_buyPrice2;
  num unit02_maxBuyPrice;
  num unit02_sellPrice;
  num unit02_sellPrice2;
  num unit02_sellPrice3;
  num unit02_discount_Percentage;
  num unit02_discount;
  dynamic unit02_isApplySellIncreasePercentage;
  dynamic unit02_isApplySellIncreasePercentage2;
  dynamic unit02_isApplySellIncreasePercentage3;
  num unit02_sellIncreasePercentage;
  num unit02_sellIncreasePercentage2;
  num unit02_cost;
  num unit02_additionalCost;
  num unit02_ConvertionMultiple;
  num unit02_ConvertionAddition;
  dynamic unit02_weight_isUseInCalculation;
  num unit02_size_Weight;
  num unit02_sellPriceFinal1;
  num unit02_sellPriceFinal2;
  num unit02_profitMarginTotal;
  num unit02_profitMarginTotal2;
  dynamic unit02_isAddPriceOrExchange;
  int unit03_unitNo_defaultSell;
  String? unit03_barCode;
  String? unit03_barCode2;
  num unit03_buyPrice;
  num unit03_buyPrice2;
  num unit03_maxBuyPrice;
  num unit03_sellPrice;
  num unit03_sellPrice2;
  num unit03_sellPrice3;
  num unit03_discount_Percentage;
  num unit03_discount;
  dynamic unit03_isApplySellIncreasePercentage;
  dynamic unit03_isApplySellIncreasePercentage2;
  dynamic unit03_isApplySellIncreasePercentage3;
  num unit03_sellIncreasePercentage;
  num unit03_sellIncreasePercentage2;
  num unit03_cost;
  num unit03_additionalCost;
  num unit03_ConvertionMultiple;
  num unit03_ConvertionAddition;
  dynamic unit03_weight_isUseInCalculation;
  num unit03_size_Weight;
  num unit03_sellPriceFinal1;
  num unit03_sellPriceFinal2;
  num unit03_profitMarginTotal;
  num unit03_profitMarginTotal2;
  dynamic unit03_isAddPriceOrExchange;
  int unit04_unitNo_defaultSell;
  String? unit04_barCode;
  String? unit04_barCode2;
  num unit04_buyPrice;
  num unit04_buyPrice2;
  num unit04_maxBuyPrice;
  num unit04_sellPrice;
  num unit04_sellPrice2;
  num unit04_sellPrice3;
  num unit04_discount_Percentage;
  num unit04_discount;
  dynamic unit04_isApplySellIncreasePercentage;
  dynamic unit04_isApplySellIncreasePercentage2;
  dynamic unit04_isApplySellIncreasePercentage3;
  num unit04_sellIncreasePercentage;
  num unit04_sellIncreasePercentage2;
  num unit04_cost;
  num unit04_additionalCost;
  num unit04_ConvertionMultiple;
  num unit04_ConvertionAddition;
  dynamic unit04_weight_isUseInCalculation;
  num unit04_size_Weight;
  num unit04_sellPriceFinal1;
  num unit04_sellPriceFinal2;
  num unit04_profitMarginTotal;
  num unit04_profitMarginTotal2;
  dynamic unit04_isAddPriceOrExchange;
  int unit05_unitNo_defaultSell;
  String? unit05_barCode;
  String? unit05_barCode2;
  num unit05_buyPrice;
  num unit05_buyPrice2;
  num unit05_maxBuyPrice;
  num unit05_sellPrice;
  num unit05_sellPrice2;
  num unit05_sellPrice3;
  num unit05_discount_Percentage;
  num unit05_discount;
  dynamic unit05_isApplySellIncreasePercentage;
  dynamic unit05_isApplySellIncreasePercentage2;
  dynamic unit05_isApplySellIncreasePercentage3;
  num unit05_sellIncreasePercentage;
  num unit05_sellIncreasePercentage2;
  num unit05_cost;
  num unit05_additionalCost;
  num unit05_ConvertionMultiple;
  num unit05_ConvertionAddition;
  dynamic unit05_weight_isUseInCalculation;
  num unit05_size_Weight;
  num unit05_sellPriceFinal1;
  num unit05_sellPriceFinal2;
  num unit05_profitMarginTotal;
  num unit05_profitMarginTotal2;
  dynamic unit05_isAddPriceOrExchange;
  String? insuranceTime;
  String? insuranceNote;
  int lineTypeNo;
  num addToExpirationDate;
  num runningCostAvg;
  dynamic purchaseRunningAvgIsApplied;
  String? purchaseRunningAvgDateG;
  num purchaseRunningAvgRecalc;
  dynamic purchaseRunningAvgRecalcIsApplied;
  String? purchaseRunningAvgRecalcDateG;
  num? place_buildingNo;
  num profitMarginTotal_fromAvgCost;
  int itemOrderNo;
  dynamic isShowInInvoice;
  dynamic zakah_isEnable;
  int uiSource;
  num departmentJobNo;

  Item({
    required this.itemNo,
    this.aName = "منتج جديد",
    this.eName = "New Product",
    required this.barCode,
    this.unitNo_defaultSell = 1,
    this.itemClassificationTreeNo = 1,
    this.taxPurchasePercent = 0,
    this.tax_isUseSeparateFieldsForTax = 0,
    this.buyPrice = 0,
    this.taxPurchaseAmount = 0,
    this.taxPercent = 0,
    this.sellPrice2 = 0,
    this.sellPrice3 = 0,
    this.sellPrice4 = 0,
    this.discount = 0,
    this.discount_Percentage = 0,
    this.VendorId = 0,
    this.parentNo,
    required this.userNumber,
    this.itemCategoryNo = 1,
    this.itemLocationNo,
    this.sellPrice = 0,
    this.leastSellPrice = 0,
    this.taxAmount = 0,
    this.firstStockQuantity = 1,
    this.unitNo_defaultStore = 1811,
    this.unitNo_defaultBuy = 1811,
    this.serialNo,
    this.serialNo2,
    this.serialNo3,
    this.isSellable = 1,
    this.IsPurchasable = 1,
    this.dateIntroduced = "",
    this.horizontalTreeNo,
    this.depthNum = 0,
    this.thirdName,
    this.aDescription,
    this.eDescription,
    this.thirdDescription,
    this.sizeName,
    this.capacity = 0,
    this.isAssembly = 0,
    this.isJob = 0,
    this.isLeaf = 1,
    this.isDisabled = 0,
    this.disabledDate,
    this.isCanDelete = 0,
    this.isCanMove = 1,
    this.isCanAdd = 1,
    this.typeNo = 725,
    this.isDeleted = 0,
    this.deletedDate,
    this.subTypeNo,
    this.statusNo = 1,
    this.nature,
    this.usedType = 735,
    this.color,
    this.note,
    this.isAllow_Discount = 1,
    this.expirationDateG,
    this.priceLevel,
    this.costMethod,
    this.countryNo,
    this.companyNo,
    this.buySellTypeNo = 3,
    this.contentInfo,
    this.fileNo,
    this.accountNo,
    this.accountNo_Second,
    this.itemDepartmentNo = 1,
    this.accountNo_Third,
    this.leastStock = 0,
    this.preferredStock = 0,
    this.maxQuantityStock = 0,
    this.defaultBuyQuantity = 0,
    this.clientVendorNo,
    this.clientVendorNo2,
    this.clientVendorNo3,
    this.clientVendorNo4,
    this.leastStock_Percentage = 0,
    this.preferredStock_Percentage = 0,
    this.maxStock_Percentage = 0,
    this.sellPrice_Type,
    this.stockLimit_Type,
    this.dealQuantity_Type,
    this.dealQuantity = 0,
    this.isDisAllow_MoreThanDealQuantity = 0,
    this.sellPrice_Deal = 0,
    this.leastSellPrice_Deal = 0,
    this.discount_Deal = 0,
    this.sellPrice_Percentage_Deal = 0,
    this.leastSellPrice_Percentage_Deal = 0,
    this.reOrderQuantity = 0,
    this.discountTotal_Deal = 0,
    this.barCode_Type,
    this.barCode_Shape,
    this.size_Length = 0,
    this.size_Width = 0,
    this.size_Height = 0,
    this.isTaxable = 0,
    this.taxRateNo,
    this.taxTypeNo,
    this.taxClassNo,
    this.isOneInvoiceUploaded = 0,
    this.appImageNo,
    this.source_PriceFrom = 0,
    this.source_isUsedAsSource = 0,
    this.source_itemNo,
    this.itemModel,
    this.supplierName1,
    this.supplierName2,
    this.unitNo_SaleDefaultUnitOrder = 0,
    this.unitNo_BuyDefaultUnitOrder = 0,
    this.barCode2,
    this.buyPrice2 = 0,
    this.maxBuyPricePercentage = 0,
    this.maxBuyPrice = 0,
    this.leastSellPricePercentage = 0,
    this.discountTotal = 0,
    this.isApplySellIncreasePercentage = 0,
    this.isApplySellIncreasePercentage2 = 0,
    this.isApplySellIncreasePercentage3 = 0,
    this.isApplySellIncreasePercentage4 = 0,
    this.isApplyLeastSellPricePercentage = 0,
    this.sellIncreasePercentage = 0,
    this.sellIncreasePercentage2 = 0,
    this.sellIncreasePercentage3 = 0,
    this.sellIncreasePercentage4 = 0,
    this.sellPrice_isTaxIncluded = 0,
    this.sellPrice_Percentage = 0,
    this.leastSellPrice_Percentage = 0,
    this.cost = 0,
    this.additionalCost = 0,
    this.sellPriceFinal1 = 0,
    this.sellPriceFinal2 = 0,
    this.sellPriceFinal3 = 0,
    this.sellPriceFinal4 = 0,
    this.sellPriceFinal5 = 0,
    this.weight_isUseInCalculation = 0,
    this.size_Weight = 0,
    this.profitMarginTotal = 0,
    this.profitMarginTotal2 = 0,
    this.profitMarginTotal3 = 0,
    this.profitMarginTotal4 = 0,
    this.unit02_unitNo_defaultSell = 0,
    this.unit02_barCode,
    this.unit02_barCode2,
    this.unit02_buyPrice = 0,
    this.unit02_buyPrice2 = 0,
    this.unit02_maxBuyPrice = 0,
    this.unit02_sellPrice = 0,
    this.unit02_sellPrice2 = 0,
    this.unit02_sellPrice3 = 0,
    this.unit02_discount_Percentage = 0,
    this.unit02_discount = 0,
    this.unit02_isApplySellIncreasePercentage = 0,
    this.unit02_isApplySellIncreasePercentage2 = 0,
    this.unit02_isApplySellIncreasePercentage3 = 0,
    this.unit02_sellIncreasePercentage = 0,
    this.unit02_sellIncreasePercentage2 = 0,
    this.unit02_cost = 0,
    this.unit02_additionalCost = 0,
    this.unit02_ConvertionMultiple = 0,
    this.unit02_ConvertionAddition = 0,
    this.unit02_weight_isUseInCalculation = 0,
    this.unit02_size_Weight = 0,
    this.unit02_sellPriceFinal1 = 0,
    this.unit02_sellPriceFinal2 = 0,
    this.unit02_profitMarginTotal = 0,
    this.unit02_profitMarginTotal2 = 0,
    this.unit02_isAddPriceOrExchange = 0,
    this.unit03_unitNo_defaultSell = 0,
    this.unit03_barCode,
    this.unit03_barCode2,
    this.unit03_buyPrice = 0,
    this.unit03_buyPrice2 = 0,
    this.unit03_maxBuyPrice = 0,
    this.unit03_sellPrice = 0,
    this.unit03_sellPrice2 = 0,
    this.unit03_sellPrice3 = 0,
    this.unit03_discount_Percentage = 0,
    this.unit03_discount = 0,
    this.unit03_isApplySellIncreasePercentage = 0,
    this.unit03_isApplySellIncreasePercentage2 = 0,
    this.unit03_isApplySellIncreasePercentage3 = 0,
    this.unit03_sellIncreasePercentage = 0,
    this.unit03_sellIncreasePercentage2 = 0,
    this.unit03_cost = 0,
    this.unit03_additionalCost = 0,
    this.unit03_ConvertionMultiple = 0,
    this.unit03_ConvertionAddition = 0,
    this.unit03_weight_isUseInCalculation = 0,
    this.unit03_size_Weight = 0,
    this.unit03_sellPriceFinal1 = 0,
    this.unit03_sellPriceFinal2 = 0,
    this.unit03_profitMarginTotal = 0,
    this.unit03_profitMarginTotal2 = 0,
    this.unit03_isAddPriceOrExchange = 0,
    this.unit04_unitNo_defaultSell = 0,
    this.unit04_barCode,
    this.unit04_barCode2,
    this.unit04_buyPrice = 0,
    this.unit04_buyPrice2 = 0,
    this.unit04_maxBuyPrice = 0,
    this.unit04_sellPrice = 0,
    this.unit04_sellPrice2 = 0,
    this.unit04_sellPrice3 = 0,
    this.unit04_discount_Percentage = 0,
    this.unit04_discount = 0,
    this.unit04_isApplySellIncreasePercentage = 0,
    this.unit04_isApplySellIncreasePercentage2 = 0,
    this.unit04_isApplySellIncreasePercentage3 = 0,
    this.unit04_sellIncreasePercentage = 0,
    this.unit04_sellIncreasePercentage2 = 0,
    this.unit04_cost = 0,
    this.unit04_additionalCost = 0,
    this.unit04_ConvertionMultiple =
        1, // Assuming default conversion multiple is 1
    this.unit04_ConvertionAddition = 0,
    this.unit04_weight_isUseInCalculation = 0,
    this.unit04_size_Weight = 0,
    this.unit04_sellPriceFinal1 = 0,
    this.unit04_sellPriceFinal2 = 0,
    this.unit04_profitMarginTotal = 0,
    this.unit04_profitMarginTotal2 = 0,
    this.unit04_isAddPriceOrExchange = 0,
    this.unit05_unitNo_defaultSell = 0,
    this.unit05_barCode,
    this.unit05_barCode2,
    this.unit05_buyPrice = 0, // Assuming unit05_buyPrice is needed
    this.unit05_buyPrice2 = 0,
    this.unit05_maxBuyPrice = 0,
    this.unit05_sellPrice = 0, // Assuming unit05_sellPrice is needed
    this.unit05_sellPrice2 = 0,
    this.unit05_sellPrice3 = 0,
    this.unit05_discount_Percentage = 0,
    this.unit05_discount = 0,
    this.unit05_isApplySellIncreasePercentage = 0,
    this.unit05_isApplySellIncreasePercentage2 = 0,
    this.unit05_isApplySellIncreasePercentage3 = 0,
    this.unit05_sellIncreasePercentage = 0,
    this.unit05_sellIncreasePercentage2 = 0,
    this.unit05_cost = 0,
    this.unit05_additionalCost = 0,
    this.unit05_ConvertionMultiple =
        1, // Assuming default conversion multiple is 1
    this.unit05_ConvertionAddition = 0,
    this.unit05_weight_isUseInCalculation = 0,
    this.unit05_size_Weight = 0,
    this.unit05_sellPriceFinal1 = 0,
    this.unit05_sellPriceFinal2 = 0,
    this.unit05_profitMarginTotal = 0,
    this.unit05_profitMarginTotal2 = 0,
    this.unit05_isAddPriceOrExchange = 0,
    this.insuranceTime,
    this.insuranceNote,
    this.lineTypeNo = 2002,
    this.addToExpirationDate = 0,
    this.runningCostAvg = 0,
    this.purchaseRunningAvgIsApplied = 0,
    this.purchaseRunningAvgDateG,
    this.purchaseRunningAvgRecalc = 0,
    this.purchaseRunningAvgRecalcIsApplied = 0,
    this.purchaseRunningAvgRecalcDateG,
    this.place_buildingNo,
    this.profitMarginTotal_fromAvgCost = 0,
    this.itemOrderNo = 0,
    this.isShowInInvoice = 0, // Assuming default is true
    this.zakah_isEnable = 0,
    this.uiSource = 0,
    this.departmentJobNo = 0,
  });

  @override
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<String> getColumnNames() => [
        'No.',
        'Edit',
        'Arabic Name',
        'English Name',
        'Delete',
      ];

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<num>(columnName: 'No.', value: itemNo),
      const DataGridCell<Widget>(columnName: 'Edit', value: null),
      DataGridCell<String>(columnName: 'Arabic Name', value: aName),
      DataGridCell<String>(columnName: 'English Name', value: eName),
      const DataGridCell<Widget>(columnName: 'Delete', value: null),
    ]);
  }
}
