// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_bill_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBillType _$CompanyBillTypeFromJson(Map<String, dynamic> json) =>
    CompanyBillType(
      billTypeNo: (json['billTypeNo'] as num).toInt(),
      VendorId: (json['VendorId'] as num?)?.toInt() ?? 0,
      isDisableVATTypeNo: json['isDisableVATTypeNo'] ?? 1,
      VATTypeNo: (json['VATTypeNo'] as num?)?.toInt() ?? 0,
      VATGroupNo: (json['VATGroupNo'] as num?)?.toInt() ?? 0,
      isUseInOutInvoice: json['isUseInOutInvoice'] ?? 0,
      reportUnderHeader: json['reportUnderHeader'] as String? ?? '',
      reportUnderHeader_En: json['reportUnderHeader_En'] as String? ?? '',
      reportUnderDataStatement:
          json['reportUnderDataStatement'] as String? ?? '',
      numOfPrintsAfterPost:
          (json['numOfPrintsAfterPost'] as num?)?.toInt() ?? 1,
      report_default_metaObjectNo:
          json['report_default_metaObjectNo'] as num? ?? 0,
      printing_isImmediateOrPreview: json['printing_isImmediateOrPreview'] ?? 0,
      report_isHide_PageHeaderFields:
          json['report_isHide_PageHeaderFields'] ?? 0,
      report_isHide_PageFooterFields:
          json['report_isHide_PageFooterFields'] ?? 0,
      report_isShowEnglishName: json['report_isShowEnglishName'] ?? 0,
      report_printerCodeName: json['report_printerCodeName'] as String? ?? null,
      report_isPrintToMultiplePrinters:
          json['report_isPrintToMultiplePrinters'] ?? 0,
      report_mainReport_isDontIncludeInPrinting:
          json['report_mainReport_isDontIncludeInPrinting'] ?? 0,
      report_OnPostTypeNo: (json['report_OnPostTypeNo'] as num?)?.toInt() ?? 0,
      afterPost_CreateNewInvoice:
          (json['afterPost_CreateNewInvoice'] as num?)?.toInt() ?? 0,
      block_dateG: json['block_dateG'] as String? ?? null,
      block_isSelected: json['block_isSelected'] ?? 0,
      block_fromDate: json['block_fromDate'] as String? ?? null,
      block_toDate: json['block_toDate'] as String? ?? null,
      block_totalTransactionsFound:
          (json['block_totalTransactionsFound'] as num?)?.toInt() ?? 0,
      block_totalTransactionsError:
          (json['block_totalTransactionsError'] as num?)?.toInt() ?? 0,
      isMainContact1_Mandatory: json['isMainContact1_Mandatory'] ?? 0,
      isDisablePriceChange: json['isDisablePriceChange'] ?? 0,
      discount_isDisable: json['discount_isDisable'] ?? 0,
      tax_isDisable: json['tax_isDisable'] ?? 0,
      report_isShowBarcode_InvoiceNo:
          json['report_isShowBarcode_InvoiceNo'] ?? 0,
      isPayments_Allowed: json['isPayments_Allowed'] ?? 0,
      numOfPrintsAfterPost_isPrintEngine:
          json['numOfPrintsAfterPost_isPrintEngine'] ?? null,
      leftMoneyPaymentDate_isMandatory:
          json['leftMoneyPaymentDate_isMandatory'] ?? 0,
      dontSellLessThanLeastPrice: json['dontSellLessThanLeastPrice'] ?? 0,
      aName_Default: json['aName_Default'] as String? ?? null,
      eName_Default: json['eName_Default'] as String? ?? null,
      onPost_isAutoFillCash: json['onPost_isAutoFillCash'] ?? 0,
      sellPrice_isDisable: json['sellPrice_isDisable'] ?? 0,
      sellPrice_isNotAllowLessThanSmallest:
          json['sellPrice_isNotAllowLessThanSmallest'] ?? 0,
      sellPrice_isNotAllow_LessThan_BuyPrice:
          json['sellPrice_isNotAllow_LessThan_BuyPrice'] ?? 0,
      isAddOnRepeatedBarcode: json['isAddOnRepeatedBarcode'] ?? 1,
      isNoPosting_AfterCashRegisterDailyPosted:
          json['isNoPosting_AfterCashRegisterDailyPosted'] ?? 0,
      isTrackLogging_Data: json['isTrackLogging_Data'] ?? 0,
      isTrackLogging_Operation: json['isTrackLogging_Operation'] ?? 0,
      isTrackLogging_Bill: json['isTrackLogging_Bill'] ?? 0,
      isShowItemUnitForm: json['isShowItemUnitForm'] ?? 1,
      item_isSearch_SerialNumber: json['item_isSearch_SerialNumber'] ?? 0,
      discountTypeNo: (json['discountTypeNo'] as num?)?.toInt() ?? 0,
      discountMultiplicationTypeNo:
          (json['discountMultiplicationTypeNo'] as num?)?.toInt() ?? 0,
      linesTotalPlusTax_roundTypeNo:
          (json['linesTotalPlusTax_roundTypeNo'] as num?)?.toInt() ?? 0,
      linesTotalPlusTax_roundToDigit:
          (json['linesTotalPlusTax_roundToDigit'] as num?)?.toInt() ?? 0,
      warn_isOnLineTax_Zero: json['warn_isOnLineTax_Zero'] ?? 0,
      warn_isOnTotalTax_Zero: json['warn_isOnTotalTax_Zero'] ?? 0,
      clientVendorNo_Default: json['clientVendorNo_Default'] as num? ?? 0,
      onItemEntry_isShow_Stock_PerStore:
          json['onItemEntry_isShow_Stock_PerStore'] ?? 0,
      onItemEntry_isShow_Stock_AllStores:
          json['onItemEntry_isShow_Stock_AllStores'] ?? 0,
      maximum_Final_Value: json['maximum_Final_Value'] as num? ?? 0,
      report_Show_ShipTo: json['report_Show_ShipTo'] ?? 0,
      isCopyItem_ContentInfo_To_Note:
          json['isCopyItem_ContentInfo_To_Note'] ?? 0,
      isShowField_Branch: json['isShowField_Branch'] ?? 1,
      isShowField_Store: json['isShowField_Store'] ?? 1,
      isShow_BranchNumber: json['isShow_BranchNumber'] ?? 1,
      isEncludeAmountInCasheir: json['isEncludeAmountInCasheir'] ?? 0,
      reportLogo_A4_placeNo:
          (json['reportLogo_A4_placeNo'] as num?)?.toInt() ?? null,
      reportLogo_80mm_placeNo:
          (json['reportLogo_80mm_placeNo'] as num?)?.toInt() ?? null,
      aNamePrefix: json['aNamePrefix'] as String? ?? null,
      aNamePostfix: json['aNamePostfix'] as String? ?? null,
      discountPercentage: json['discountPercentage'] as num? ?? 0,
      clientMsgOnPost: json['clientMsgOnPost'] as String? ?? null,
      Msg_isSendWhatsapp_on_post: json['Msg_isSendWhatsapp_on_post'] ?? 0,
      Msg_whatsappMessage_on_post:
          json['Msg_whatsappMessage_on_post'] as String? ?? null,
      Msg_isSendSMS_on_post: json['Msg_isSendSMS_on_post'] ?? 0,
      Msg_SMSMessage_on_post: json['Msg_SMSMessage_on_post'] as String? ?? null,
      Msg_isSendEMail_on_post: json['Msg_isSendEMail_on_post'] ?? 0,
      Msg_eMailMessage_on_post:
          json['Msg_eMailMessage_on_post'] as String? ?? null,
      isStopWarning_On_LeftAmount: json['isStopWarning_On_LeftAmount'] ?? 0,
      quantityFromType: (json['quantityFromType'] as num?)?.toInt() ?? null,
      quantityFromField: json['quantityFromField'] as String? ?? null,
      userRunTimeNote: json['userRunTimeNote'] as String? ?? null,
      isAdd_ThingNote: json['isAdd_ThingNote'] ?? 0,
      isPrintContract: json['isPrintContract'] ?? 0,
      contractName: json['contractName'] as String? ?? null,
      isShowRightPaneItems: json['isShowRightPaneItems'] ?? 1,
    );

Map<String, dynamic> _$CompanyBillTypeToJson(CompanyBillType instance) =>
    <String, dynamic>{
      'billTypeNo': instance.billTypeNo,
      'VendorId': instance.VendorId,
      'isDisableVATTypeNo': instance.isDisableVATTypeNo,
      'VATTypeNo': instance.VATTypeNo,
      'VATGroupNo': instance.VATGroupNo,
      'isUseInOutInvoice': instance.isUseInOutInvoice,
      'reportUnderHeader': instance.reportUnderHeader,
      'reportUnderHeader_En': instance.reportUnderHeader_En,
      'reportUnderDataStatement': instance.reportUnderDataStatement,
      'numOfPrintsAfterPost': instance.numOfPrintsAfterPost,
      'report_default_metaObjectNo': instance.report_default_metaObjectNo,
      'printing_isImmediateOrPreview': instance.printing_isImmediateOrPreview,
      'report_isHide_PageHeaderFields': instance.report_isHide_PageHeaderFields,
      'report_isHide_PageFooterFields': instance.report_isHide_PageFooterFields,
      'report_isShowEnglishName': instance.report_isShowEnglishName,
      'report_printerCodeName': instance.report_printerCodeName,
      'report_isPrintToMultiplePrinters':
          instance.report_isPrintToMultiplePrinters,
      'report_mainReport_isDontIncludeInPrinting':
          instance.report_mainReport_isDontIncludeInPrinting,
      'report_OnPostTypeNo': instance.report_OnPostTypeNo,
      'afterPost_CreateNewInvoice': instance.afterPost_CreateNewInvoice,
      'block_dateG': instance.block_dateG,
      'block_isSelected': instance.block_isSelected,
      'block_fromDate': instance.block_fromDate,
      'block_toDate': instance.block_toDate,
      'block_totalTransactionsFound': instance.block_totalTransactionsFound,
      'block_totalTransactionsError': instance.block_totalTransactionsError,
      'isMainContact1_Mandatory': instance.isMainContact1_Mandatory,
      'isDisablePriceChange': instance.isDisablePriceChange,
      'discount_isDisable': instance.discount_isDisable,
      'tax_isDisable': instance.tax_isDisable,
      'report_isShowBarcode_InvoiceNo': instance.report_isShowBarcode_InvoiceNo,
      'isPayments_Allowed': instance.isPayments_Allowed,
      'numOfPrintsAfterPost_isPrintEngine':
          instance.numOfPrintsAfterPost_isPrintEngine,
      'leftMoneyPaymentDate_isMandatory':
          instance.leftMoneyPaymentDate_isMandatory,
      'dontSellLessThanLeastPrice': instance.dontSellLessThanLeastPrice,
      'aName_Default': instance.aName_Default,
      'eName_Default': instance.eName_Default,
      'onPost_isAutoFillCash': instance.onPost_isAutoFillCash,
      'sellPrice_isDisable': instance.sellPrice_isDisable,
      'sellPrice_isNotAllowLessThanSmallest':
          instance.sellPrice_isNotAllowLessThanSmallest,
      'sellPrice_isNotAllow_LessThan_BuyPrice':
          instance.sellPrice_isNotAllow_LessThan_BuyPrice,
      'isAddOnRepeatedBarcode': instance.isAddOnRepeatedBarcode,
      'isNoPosting_AfterCashRegisterDailyPosted':
          instance.isNoPosting_AfterCashRegisterDailyPosted,
      'isTrackLogging_Data': instance.isTrackLogging_Data,
      'isTrackLogging_Operation': instance.isTrackLogging_Operation,
      'isTrackLogging_Bill': instance.isTrackLogging_Bill,
      'isShowItemUnitForm': instance.isShowItemUnitForm,
      'item_isSearch_SerialNumber': instance.item_isSearch_SerialNumber,
      'discountTypeNo': instance.discountTypeNo,
      'discountMultiplicationTypeNo': instance.discountMultiplicationTypeNo,
      'linesTotalPlusTax_roundTypeNo': instance.linesTotalPlusTax_roundTypeNo,
      'linesTotalPlusTax_roundToDigit': instance.linesTotalPlusTax_roundToDigit,
      'warn_isOnLineTax_Zero': instance.warn_isOnLineTax_Zero,
      'warn_isOnTotalTax_Zero': instance.warn_isOnTotalTax_Zero,
      'clientVendorNo_Default': instance.clientVendorNo_Default,
      'onItemEntry_isShow_Stock_PerStore':
          instance.onItemEntry_isShow_Stock_PerStore,
      'onItemEntry_isShow_Stock_AllStores':
          instance.onItemEntry_isShow_Stock_AllStores,
      'maximum_Final_Value': instance.maximum_Final_Value,
      'report_Show_ShipTo': instance.report_Show_ShipTo,
      'isCopyItem_ContentInfo_To_Note': instance.isCopyItem_ContentInfo_To_Note,
      'isShowField_Branch': instance.isShowField_Branch,
      'isShowField_Store': instance.isShowField_Store,
      'isShow_BranchNumber': instance.isShow_BranchNumber,
      'isEncludeAmountInCasheir': instance.isEncludeAmountInCasheir,
      'reportLogo_A4_placeNo': instance.reportLogo_A4_placeNo,
      'reportLogo_80mm_placeNo': instance.reportLogo_80mm_placeNo,
      'aNamePrefix': instance.aNamePrefix,
      'aNamePostfix': instance.aNamePostfix,
      'discountPercentage': instance.discountPercentage,
      'clientMsgOnPost': instance.clientMsgOnPost,
      'Msg_isSendWhatsapp_on_post': instance.Msg_isSendWhatsapp_on_post,
      'Msg_whatsappMessage_on_post': instance.Msg_whatsappMessage_on_post,
      'Msg_isSendSMS_on_post': instance.Msg_isSendSMS_on_post,
      'Msg_SMSMessage_on_post': instance.Msg_SMSMessage_on_post,
      'Msg_isSendEMail_on_post': instance.Msg_isSendEMail_on_post,
      'Msg_eMailMessage_on_post': instance.Msg_eMailMessage_on_post,
      'isStopWarning_On_LeftAmount': instance.isStopWarning_On_LeftAmount,
      'quantityFromType': instance.quantityFromType,
      'quantityFromField': instance.quantityFromField,
      'userRunTimeNote': instance.userRunTimeNote,
      'isAdd_ThingNote': instance.isAdd_ThingNote,
      'isPrintContract': instance.isPrintContract,
      'contractName': instance.contractName,
      'isShowRightPaneItems': instance.isShowRightPaneItems,
    };
