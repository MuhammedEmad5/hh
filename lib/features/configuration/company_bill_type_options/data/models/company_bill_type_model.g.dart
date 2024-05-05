// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_bill_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBillType _$CompanyBillTypeFromJson(Map<String, dynamic> json) =>
    CompanyBillType(
      billTypeNo: (json['billTypeNo'] as num).toInt(),
      VendorId: (json['VendorId'] as num?)?.toInt() ?? 0,
      isDisableVATTypeNo: json['isDisableVATTypeNo'] ?? false,
      VATTypeNo: (json['VATTypeNo'] as num?)?.toInt() ?? 0,
      VATGroupNo: (json['VATGroupNo'] as num?)?.toInt() ?? 0,
      isUseInOutInvoice: json['isUseInOutInvoice'] ?? false,
      reportUnderHeader: json['reportUnderHeader'] as String? ?? '',
      reportUnderHeader_En: json['reportUnderHeader_En'] as String? ?? '',
      reportUnderDataStatement:
          json['reportUnderDataStatement'] as String? ?? '',
      numOfPrintsAfterPost:
          (json['numOfPrintsAfterPost'] as num?)?.toInt() ?? 0,
      report_default_metaObjectNo:
          json['report_default_metaObjectNo'] as num? ?? 0,
      printing_isImmediateOrPreview:
          json['printing_isImmediateOrPreview'] ?? false,
      report_isHide_PageHeaderFields:
          json['report_isHide_PageHeaderFields'] ?? false,
      report_isHide_PageFooterFields:
          json['report_isHide_PageFooterFields'] ?? false,
      report_isShowEnglishName: json['report_isShowEnglishName'] ?? false,
      report_printerCodeName: json['report_printerCodeName'] as String? ?? '',
      report_isPrintToMultiplePrinters:
          json['report_isPrintToMultiplePrinters'] ?? false,
      report_mainReport_isDontIncludeInPrinting:
          json['report_mainReport_isDontIncludeInPrinting'] ?? false,
      report_OnPostTypeNo: (json['report_OnPostTypeNo'] as num?)?.toInt() ?? 0,
      afterPost_CreateNewInvoice:
          (json['afterPost_CreateNewInvoice'] as num?)?.toInt() ?? 0,
      block_dateG: json['block_dateG'] as String? ?? '',
      block_isSelected: json['block_isSelected'] ?? false,
      block_fromDate: json['block_fromDate'] as String? ?? '',
      block_toDate: json['block_toDate'] as String? ?? '',
      block_totalTransactionsFound:
          (json['block_totalTransactionsFound'] as num?)?.toInt() ?? 0,
      block_totalTransactionsError:
          (json['block_totalTransactionsError'] as num?)?.toInt() ?? 0,
      isMainContact1_Mandatory: json['isMainContact1_Mandatory'] ?? false,
      isDisablePriceChange: json['isDisablePriceChange'] ?? false,
      discount_isDisable: json['discount_isDisable'] ?? false,
      tax_isDisable: json['tax_isDisable'] ?? false,
      report_isShowBarcode_InvoiceNo:
          json['report_isShowBarcode_InvoiceNo'] ?? false,
      isPayments_Allowed: json['isPayments_Allowed'] ?? false,
      numOfPrintsAfterPost_isPrintEngine:
          json['numOfPrintsAfterPost_isPrintEngine'] ?? false,
      leftMoneyPaymentDate_isMandatory:
          json['leftMoneyPaymentDate_isMandatory'] ?? false,
      dontSellLessThanLeastPrice: json['dontSellLessThanLeastPrice'] ?? false,
      aName_Default: json['aName_Default'] as String? ?? '',
      eName_Default: json['eName_Default'] as String? ?? '',
      onPost_isAutoFillCash: json['onPost_isAutoFillCash'] ?? false,
      sellPrice_isDisable: json['sellPrice_isDisable'] ?? false,
      sellPrice_isNotAllowLessThanSmallest:
          json['sellPrice_isNotAllowLessThanSmallest'] ?? false,
      sellPrice_isNotAllow_LessThan_BuyPrice:
          json['sellPrice_isNotAllow_LessThan_BuyPrice'] ?? false,
      isAddOnRepeatedBarcode: json['isAddOnRepeatedBarcode'] ?? false,
      isNoPosting_AfterCashRegisterDailyPosted:
          json['isNoPosting_AfterCashRegisterDailyPosted'] ?? false,
      isTrackLogging_Data: json['isTrackLogging_Data'] ?? false,
      isTrackLogging_Operation: json['isTrackLogging_Operation'] ?? false,
      isTrackLogging_Bill: json['isTrackLogging_Bill'] ?? false,
      isShowItemUnitForm: json['isShowItemUnitForm'] ?? false,
      item_isSearch_SerialNumber: json['item_isSearch_SerialNumber'] ?? false,
      discountTypeNo: (json['discountTypeNo'] as num?)?.toInt() ?? 0,
      discountMultiplicationTypeNo:
          (json['discountMultiplicationTypeNo'] as num?)?.toInt() ?? 0,
      linesTotalPlusTax_roundTypeNo:
          (json['linesTotalPlusTax_roundTypeNo'] as num?)?.toInt() ?? 0,
      linesTotalPlusTax_roundToDigit:
          (json['linesTotalPlusTax_roundToDigit'] as num?)?.toInt() ?? 0,
      warn_isOnLineTax_Zero: json['warn_isOnLineTax_Zero'] ?? false,
      warn_isOnTotalTax_Zero: json['warn_isOnTotalTax_Zero'] ?? false,
      clientVendorNo_Default: json['clientVendorNo_Default'] as num? ?? 0,
      onItemEntry_isShow_Stock_PerStore:
          json['onItemEntry_isShow_Stock_PerStore'] ?? false,
      onItemEntry_isShow_Stock_AllStores:
          json['onItemEntry_isShow_Stock_AllStores'] ?? false,
      maximum_Final_Value: json['maximum_Final_Value'] as num? ?? 0,
      report_Show_ShipTo: json['report_Show_ShipTo'] ?? false,
      isCopyItem_ContentInfo_To_Note:
          json['isCopyItem_ContentInfo_To_Note'] ?? false,
      isShowField_Branch: json['isShowField_Branch'] ?? false,
      isShowField_Store: json['isShowField_Store'] ?? false,
      isShow_BranchNumber: json['isShow_BranchNumber'] ?? false,
      isEncludeAmountInCasheir: json['isEncludeAmountInCasheir'] ?? false,
      reportLogo_A4_placeNo:
          (json['reportLogo_A4_placeNo'] as num?)?.toInt() ?? 0,
      reportLogo_80mm_placeNo:
          (json['reportLogo_80mm_placeNo'] as num?)?.toInt() ?? 0,
      aNamePrefix: json['aNamePrefix'] as String? ?? '',
      aNamePostfix: json['aNamePostfix'] as String? ?? '',
      discountPercentage: json['discountPercentage'] as num? ?? 0,
      clientMsgOnPost: json['clientMsgOnPost'] as String? ?? '',
      Msg_isSendWhatsapp_on_post: json['Msg_isSendWhatsapp_on_post'] ?? false,
      Msg_whatsappMessage_on_post:
          json['Msg_whatsappMessage_on_post'] as String? ?? '',
      Msg_isSendSMS_on_post: json['Msg_isSendSMS_on_post'] ?? false,
      Msg_SMSMessage_on_post: json['Msg_SMSMessage_on_post'] as String? ?? '',
      Msg_isSendEMail_on_post: json['Msg_isSendEMail_on_post'] ?? false,
      Msg_eMailMessage_on_post:
          json['Msg_eMailMessage_on_post'] as String? ?? '',
      isStopWarning_On_LeftAmount: json['isStopWarning_On_LeftAmount'] ?? false,
    )
      ..quantityFromType = (json['quantityFromType'] as num?)?.toInt()
      ..quantityFromField = json['quantityFromField'] as String?
      ..userRunTimeNote = json['userRunTimeNote'] as String?
      ..isAdd_ThingNote = json['isAdd_ThingNote']
      ..isPrintContract = json['isPrintContract']
      ..contractName = json['contractName'] as String?
      ..isShowRightPaneItems = json['isShowRightPaneItems'];

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
