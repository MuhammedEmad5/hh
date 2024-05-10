import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/model/json_model.dart';

part 'company_bill_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyBillType implements JsonModel {
  int billTypeNo;
  int? VendorId;
  dynamic isDisableVATTypeNo;
  int? VATTypeNo;
  int? VATGroupNo;
  dynamic isUseInOutInvoice;
  String? reportUnderHeader;
  String? reportUnderHeader_En;
  String? reportUnderDataStatement;
  int? numOfPrintsAfterPost;
  num? report_default_metaObjectNo;
  dynamic printing_isImmediateOrPreview;
  dynamic report_isHide_PageHeaderFields;
  dynamic report_isHide_PageFooterFields;
  dynamic report_isShowEnglishName;
  String? report_printerCodeName;
  dynamic report_isPrintToMultiplePrinters;
  dynamic report_mainReport_isDontIncludeInPrinting;
  int? report_OnPostTypeNo;
  int? afterPost_CreateNewInvoice;
  String? block_dateG;
  dynamic block_isSelected;
  String? block_fromDate;
  String? block_toDate;
  int? block_totalTransactionsFound;
  int? block_totalTransactionsError;
  dynamic isMainContact1_Mandatory;
  dynamic isDisablePriceChange;
  dynamic discount_isDisable;
  dynamic tax_isDisable;
  dynamic report_isShowBarcode_InvoiceNo;
  dynamic isPayments_Allowed;
  dynamic numOfPrintsAfterPost_isPrintEngine;
  dynamic leftMoneyPaymentDate_isMandatory;
  dynamic dontSellLessThanLeastPrice;
  String? aName_Default;
  String? eName_Default;
  dynamic onPost_isAutoFillCash;
  dynamic sellPrice_isDisable;
  dynamic sellPrice_isNotAllowLessThanSmallest;
  dynamic sellPrice_isNotAllow_LessThan_BuyPrice;
  dynamic isAddOnRepeatedBarcode;
  dynamic isNoPosting_AfterCashRegisterDailyPosted;
  dynamic isTrackLogging_Data;
  dynamic isTrackLogging_Operation;
  dynamic isTrackLogging_Bill;
  dynamic isShowItemUnitForm;
  dynamic item_isSearch_SerialNumber;
  int? discountTypeNo;
  int? discountMultiplicationTypeNo;
  int? linesTotalPlusTax_roundTypeNo;
  int? linesTotalPlusTax_roundToDigit;
  dynamic warn_isOnLineTax_Zero;
  dynamic warn_isOnTotalTax_Zero;
  num? clientVendorNo_Default;
  dynamic onItemEntry_isShow_Stock_PerStore;
  dynamic onItemEntry_isShow_Stock_AllStores;
  num? maximum_Final_Value;
  dynamic report_Show_ShipTo;
  dynamic isCopyItem_ContentInfo_To_Note;
  dynamic isShowField_Branch;
  dynamic isShowField_Store;
  dynamic isShow_BranchNumber;
  dynamic isEncludeAmountInCasheir;
  int? reportLogo_A4_placeNo;
  int? reportLogo_80mm_placeNo;
  String? aNamePrefix;
  String? aNamePostfix;
  num? discountPercentage;
  String? clientMsgOnPost;
  dynamic Msg_isSendWhatsapp_on_post;
  String? Msg_whatsappMessage_on_post;
  dynamic Msg_isSendSMS_on_post;
  String? Msg_SMSMessage_on_post;
  dynamic Msg_isSendEMail_on_post;
  String? Msg_eMailMessage_on_post;
  dynamic isStopWarning_On_LeftAmount;
  int? quantityFromType;
  String? quantityFromField;
  String? userRunTimeNote;
  dynamic isAdd_ThingNote;
  dynamic isPrintContract;
  String? contractName;
  dynamic isShowRightPaneItems;

  CompanyBillType({
    required this.billTypeNo,
    this.VendorId = 0,
    this.isDisableVATTypeNo = 1,
    this.VATTypeNo = 0,
    this.VATGroupNo = 0,
    this.isUseInOutInvoice = 0,
    this.reportUnderHeader = '',
    this.reportUnderHeader_En = '',
    this.reportUnderDataStatement = '',
    this.numOfPrintsAfterPost = 1,
    this.report_default_metaObjectNo = 0,
    this.printing_isImmediateOrPreview = 0,
    this.report_isHide_PageHeaderFields = 0,
    this.report_isHide_PageFooterFields = 0,
    this.report_isShowEnglishName = 0,
    this.report_printerCodeName = null,
    this.report_isPrintToMultiplePrinters = 0,
    this.report_mainReport_isDontIncludeInPrinting = 0,
    this.report_OnPostTypeNo = 0,
    this.afterPost_CreateNewInvoice = 0,
    this.block_dateG = null,
    this.block_isSelected = 0,
    this.block_fromDate = null,
    this.block_toDate = null,
    this.block_totalTransactionsFound = 0,
    this.block_totalTransactionsError = 0,
    this.isMainContact1_Mandatory = 0,
    this.isDisablePriceChange = 0,
    this.discount_isDisable = 0,
    this.tax_isDisable = 0,
    this.report_isShowBarcode_InvoiceNo = 0,
    this.isPayments_Allowed = 0,
    this.numOfPrintsAfterPost_isPrintEngine = null,
    this.leftMoneyPaymentDate_isMandatory = 0,
    this.dontSellLessThanLeastPrice = 0,
    this.aName_Default = null,
    this.eName_Default = null,
    this.onPost_isAutoFillCash = 0,
    this.sellPrice_isDisable = 0,
    this.sellPrice_isNotAllowLessThanSmallest = 0,
    this.sellPrice_isNotAllow_LessThan_BuyPrice = 0,
    this.isAddOnRepeatedBarcode = 1,
    this.isNoPosting_AfterCashRegisterDailyPosted = 0,
    this.isTrackLogging_Data = 0,
    this.isTrackLogging_Operation = 0,
    this.isTrackLogging_Bill = 0,
    this.isShowItemUnitForm = 1,
    this.item_isSearch_SerialNumber = 0,
    this.discountTypeNo = 0,
    this.discountMultiplicationTypeNo = 0,
    this.linesTotalPlusTax_roundTypeNo = 0,
    this.linesTotalPlusTax_roundToDigit = 0,
    this.warn_isOnLineTax_Zero = 0,
    this.warn_isOnTotalTax_Zero = 0,
    this.clientVendorNo_Default = 0,
    this.onItemEntry_isShow_Stock_PerStore = 0,
    this.onItemEntry_isShow_Stock_AllStores = 0,
    this.maximum_Final_Value = 0,
    this.report_Show_ShipTo = 0,
    this.isCopyItem_ContentInfo_To_Note = 0,
    this.isShowField_Branch = 1,
    this.isShowField_Store = 1,
    this.isShow_BranchNumber = 1,
    this.isEncludeAmountInCasheir = 0,
    this.reportLogo_A4_placeNo = null,
    this.reportLogo_80mm_placeNo = null,
    this.aNamePrefix = null,
    this.aNamePostfix = null,
    this.discountPercentage = 0,
    this.clientMsgOnPost = null,
    this.Msg_isSendWhatsapp_on_post = 0,
    this.Msg_whatsappMessage_on_post = null,
    this.Msg_isSendSMS_on_post = 0,
    this.Msg_SMSMessage_on_post = null,
    this.Msg_isSendEMail_on_post = 0,
    this.Msg_eMailMessage_on_post = null,
    this.isStopWarning_On_LeftAmount = 0,
    this.quantityFromType = null,
    this.quantityFromField = null,
    this.userRunTimeNote = null,
    this.isAdd_ThingNote = 0,
    this.isPrintContract = 0,
    this.contractName = null,
    this.isShowRightPaneItems = 1,
  });

  @override
  factory CompanyBillType.fromJson(Map<String, dynamic> json) =>
      _$CompanyBillTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyBillTypeToJson(this);
}
