import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../core/model/json_model.dart';


part 'building_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Building implements JsonModel {
  num VendorId;
  num buildingNo;
  num? parentNo;
  String? userNumber;
  int depthNum;
  String aName;
  String? eName;
  String? aDescription;
  String? eDescription;
  dynamic? isShowInProfit;
  String? job;
  int? officeNumber;
  int? studentNumber;
  num maxBalanceAllowed;
  num minBalanceAllowed;
  num warnMinBalance;
  num warnMaxBalance;
  dynamic isLeaf;
  dynamic isDisabled;
  dynamic isCanDelete;
  dynamic isCanMove;
  dynamic isCanAdd;
  int typeNo;
  int? subTypeNo;
  int? statusNo;
  int? nature;
  dynamic isOwned;
  dynamic isLand;
  String? note;
  dynamic isPosted;
  dynamic isDeleted;
  String? deletedDate;
  String? disabledDate;
  num? tableNo;
  num? fileNo;
  num? accountNo_Second_ForLogger;
  int? accountNo_Second_depth;
  num? horizontalTreeNo;
  num? accountNo;
  String? necMac;
  num? themeNo;
  int? personNo;
  num? regionNo;
  int? optReport_UserType;
  int? reportHeaderWord_Type;
  dynamic reportHeaderWord_isVisible;
  dynamic isUseReportIcon;
  String? reportIconPath;
  dynamic isUseIconInsteadOfHeader;
  String? repaName;
  String? aBusinessRegistrationNo;
  String? repeName;
  String? eBusinessRegistrationNo;
  String? barCode;
  int? buildingType;
  String? placeDeliveryDate;
  dynamic isDb;
  num? centralComputerBuildingNo;
  String? computer;
  String? sqlInstance;
  String? mainDatabase;
  int? connectTimeout;
  String? buildingSec;
  String? buildingT;
  num? storeNo_buildingNo;
  int building_CompanyNo;
  dynamic z____Report_;
  String? calculatedStoreTotalsDateG;
  num buyPrice_Total;
  num maxBuyPrice_Total;
  num size_Weight_Total;
  num cost_Total;
  num additionalCost_Total;
  num sellPrice_Total;
  num sellPrice2_Total;
  num sellPrice3_Total;
  num sellPrice4_Total;
  num profitMarginTotal_Total;
  num profitMarginTotal2_Total;
  num profitMarginTotal3_Total;
  num profitMarginTotal4_Total;
  num leastSellPrice_Total;
  num discount_Total;
  String? address;
  String? report_Link;
  String? Msg_whatsappPhoneFrom;
  String? Msg_SMSPhoneFrom;
  String? Msg_eMailFrom;
  String? Msg_whatsappPhoneManagers;
  String? Msg_SMSPhoneManagers;
  String? Msg_eMailManagers;
  String? zv2_ProdCsidSecret;
  String? zv2_ProdCsidBinarySecurityToken;
  String? zv2_ProdCsidRequestId;
  String? zv2_ComplianceSecret;
  String? zv2_ComplianceBinarySecurityToken;
  String? zv2_ComplianceRequestId;
  String? zv2_Csr;
  String? zv2_otp;
  String? zv2_Country;
  String? zv2_Industry;
  String? zv2_VAT;
  String? zv2_UniqueIdentifier;
  String? zv2_UniqueNameOfUnit;
  String? zv2_CRN;
  num? departmentJobNo;
  //RowTimestamp rowTimestamp;
  String? zatcaDeviceID;
  String? zatcaToken;
  String? zatcaHash;
  dynamic? isMismatchingWithApp;
  int zatcaStage;
  String? zatcaInvoiceType;
  int secondBusinessIDType;
  String? secondBusinessID;
  int ZATCA_B2C_SendingIntervalType;
  int ZATCA_B2C_SendingIntervalTime;
  // int zatca_VATCategoryCodeSubType;
  String? apartmentNum;
  String? POBox;
  String? POBoxAdditionalNum;
  String? street_Arb;
  String? street_Eng;
  String? district_Arb;
  String? district_Eng;
  String? city_Arb;
  String? city_Eng;
  String? countrySubdivision_Arb;
  String? countrySubdivision_Eng;
  String? country_Arb;
  String? country_Eng;
  int countryNo;

  Building({
    this.VendorId = 0,
    required this.buildingNo,
    this.parentNo,
    String?  userNumber ,
    this.depthNum = 0,
    required this.aName,
     this.eName,
    this.aDescription,
    this.eDescription,
    dynamic isShowInProfit ,
    this.job ,
    this.officeNumber,
    this.studentNumber,
    this.maxBalanceAllowed = 0.000000,
    this.minBalanceAllowed = 0.000000,
    this.warnMinBalance = 0.000000,
    this.warnMaxBalance = 0.000000,
    this.isLeaf = 0,
    this.isDisabled = 0,
    this.isCanDelete = 0,
    this.isCanMove = 0,
    this.isCanAdd = 0,
    this.typeNo = 1,
    this.subTypeNo,
    this.statusNo,
    this.nature,
    this.isOwned = 0,
    this.isLand = 0,
    this.note,
    this.isPosted = 0,
    this.isDeleted = 0,
    this.deletedDate,
    this.disabledDate,
    this.tableNo,
    this.fileNo,
    this.accountNo_Second_ForLogger,
    this.accountNo_Second_depth,
    this.horizontalTreeNo,
    this.accountNo,
    this.necMac,
    this.themeNo,
    this.personNo,
    this.regionNo,
    this.optReport_UserType,
    this.reportHeaderWord_Type,
    this.reportHeaderWord_isVisible = 0,
    this.isUseReportIcon = 0,
    this.reportIconPath,
    this.isUseIconInsteadOfHeader = 0,
    this.repaName,
    this.aBusinessRegistrationNo,
    this.repeName,
    this.eBusinessRegistrationNo,
    this.barCode,
    this.buildingType,
    this.placeDeliveryDate,
    this.isDb = 0,
    this.centralComputerBuildingNo,
    this.computer,
    this.sqlInstance,
    this.mainDatabase,
    this.connectTimeout,
    this.buildingSec,
    this.buildingT,
    this.storeNo_buildingNo,
    this.building_CompanyNo = 1,
    this.z____Report_ = 0,
    this.calculatedStoreTotalsDateG,
    this.buyPrice_Total = 0.000000,
    this.maxBuyPrice_Total = 0.000000,
    this.size_Weight_Total = 0.000000,
    this.cost_Total = 0.000000,
    this.additionalCost_Total = 0.000000,
    this.sellPrice_Total = 0.000000,
    this.sellPrice2_Total = 0.000000,
    this.sellPrice3_Total = 0.000000,
    this.sellPrice4_Total = 0.000000,
    this.profitMarginTotal_Total = 0.000000,
    this.profitMarginTotal2_Total = 0.000000,
    this.profitMarginTotal3_Total = 0.000000,
    this.profitMarginTotal4_Total = 0.000000,
    this.leastSellPrice_Total = 0.000000,
    this.discount_Total = 0.000000,
    this.address,
    this.report_Link,
    this.Msg_whatsappPhoneFrom,
    this.Msg_SMSPhoneFrom,
    this.Msg_eMailFrom,
    this.Msg_whatsappPhoneManagers,
    this.Msg_SMSPhoneManagers,
    this.Msg_eMailManagers,
    this.zv2_ProdCsidSecret,
    this.zv2_ProdCsidBinarySecurityToken,
    this.zv2_ProdCsidRequestId,
    this.zv2_ComplianceSecret,
    this.zv2_ComplianceBinarySecurityToken,
    this.zv2_ComplianceRequestId,
    this.zv2_Csr,
    this.zv2_otp,
    this.zv2_Country,
    this.zv2_Industry,
    this.zv2_VAT,
    this.zv2_UniqueIdentifier,
    this.zv2_UniqueNameOfUnit,
    this.zv2_CRN,
    this.departmentJobNo ,
    // this.rowTimestamp,
    this.zatcaDeviceID,
    this.zatcaToken,
    this.zatcaHash,
    this.isMismatchingWithApp,
    this.zatcaStage = 0,
    this.zatcaInvoiceType,
    this.secondBusinessIDType = 0,
    this.secondBusinessID,
    this.ZATCA_B2C_SendingIntervalType = 0,
    this.ZATCA_B2C_SendingIntervalTime = 0,
   // this.zatca_VATCategoryCodeSubType = 0,
    this.apartmentNum,
    this.POBox,
    this.POBoxAdditionalNum,
    this.street_Arb,
    this.street_Eng,
    this.district_Arb,
    this.district_Eng,
    this.city_Arb,
    this.city_Eng,
    this.countrySubdivision_Arb,
    this.countrySubdivision_Eng,
    this.country_Arb,
    this.country_Eng,
    this.countryNo = 0,
  }) : userNumber = userNumber ?? buildingNo.toString();

  @override
  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
