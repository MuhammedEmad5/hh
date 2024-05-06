import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/model/json_model.dart';
part 'client_vendor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ClientVendor implements JsonModel {
  final int VendorId;
  final num clientVendorNo;
  final String userNumber;
  final num? parentNo;
  final int depthNum;
  final String? aName;
  final String? eName;
  final String? aDescription;
  final String? eDescription;
  final int? typeOfClientOrVendor;
// 1 Client / Vendor, 2 Client, 3 Vendor
  final String? mainContact1;
  final String? mainContact2;
  final String? mainContact3;
  final String? mainContact4;
  final String? VATID;
  final String? note;
  final num maxBalanceAllowed;
  final num minBalanceAllowed;
  final num warnMinBalance;
  final num warnMaxBalance;
  final dynamic isLeaf;
  final dynamic isDisabled;
  final dynamic isCanDelete;
  final dynamic isCanMove;
  final dynamic isCanAdd;
  final dynamic isDeleted;
  final num openCredit;
  final num openDebit;
  final num openBalance;
  final String? openBalanceDate;
// 2022-05-31T20:55:11.100Z
  final num credit;
  final num debit;
  final num creditCount;
  final num debitCount;
  final num creditDebitCount;
  final String? creditDebitDateTime;
  final num currentBalance;
  final String? currentBalanceDateG;
// 2022-05-31T20:55:11.100Z
  final String? dateG;
  final dynamic isProspect;
  final num discountPercentage;
  final dynamic isPointsApplicant;
  final num society_updatePercent;
  final num society_income_Monthly;
  final num society_income_Average;
  final num society_income_Percent;
  final num society_unAbilityPercentage;
  final dynamic support_isMoney;
  final dynamic support_isProduct;
  final dynamic isFollowUpFile;
  final num society_amount;
  final String gps_latitude;

  ///
  final String gps_longitude;

  ///
  final dynamic society_isOrphan;

  final String? address;
  final num society_noOfDependents;
  final num society_noOfGuaranteed;
  final num society_sumExpense;
  final num society_sumIncome;
  final num society_diffrenceBetweenExpenseIncome;
  final num society_SumExpenseIncomePerDependent;
  final dynamic isGiveHelpFromSociety;
  final String? apartmentNum;
  final String? street_Arb;
  final String? street_Eng;
  final String? district_Arb;
  final String? district_Eng;
  final String? city_Arb;
  final String? city_Eng;
  final String country_Arb;
  final String country_Eng;
  final String? POBox;
  final String? POBoxAdditionalNum;
  final int? secondBusinessIDType;
  final String? secondBusinessID;
  final num watch01_amount;
  final num watch02_amount;
  final num watch03_amount;
  final num watch04_amount;
  final num trainingHourseToBeGiven;
  final num trainingHourseLeft;
  final dynamic cameFromIsPayedHisMoney;
  final int uiSource;
  final num departmentJobNo;
  // final Map row_timestamp;
  // {"type": "Buffer", data: [0, 0, 0, 0, 3, 209, 212, 82]}
  // row_timestamp 0x0000000000092FEE

  ClientVendor({
    this.VendorId = 0,
    required this.clientVendorNo,
    required this.userNumber,
    this.parentNo,
    this.depthNum = 0,
    this.aName = '',
    this.eName = '',
    this.aDescription,
    this.eDescription,
    this.typeOfClientOrVendor = 1,
    this.mainContact1,
    this.mainContact2,
    this.mainContact3,
    this.mainContact4,
    this.VATID,
    this.note,
    this.maxBalanceAllowed = 0.0,
    this.minBalanceAllowed = 0.0,
    this.warnMinBalance = 0.0,
    this.warnMaxBalance = 0.0,
    this.isLeaf = 0, // bool dynamic
    this.isDisabled = 0, // bool dynamic
    this.isCanDelete = 0, // bool dynamic
    this.isCanMove = 0, // bool dynamic
    this.isCanAdd = 0, // bool dynamic
    this.isDeleted = 0, // bool dynamic
    this.openCredit = 0.0,
    this.openDebit = 0.0,
    this.openBalance = 0.0,
    this.openBalanceDate,
    this.credit = 0.0,
    this.debit = 0.0,
    this.creditCount = 0.0,
    this.debitCount = 0.0,
    this.creditDebitCount = 0.0,
    this.creditDebitDateTime,
    this.currentBalance = 0.0,
    this.currentBalanceDateG,
    this.dateG,
    this.isProspect = 0, // bool dynamic
    this.discountPercentage = 0.0,
    this.isPointsApplicant = 0, // bool dynamic
    this.society_updatePercent = 0.0,
    this.society_income_Monthly = 0.0,
    this.society_income_Average = 0.0,
    this.society_income_Percent = 0.0,
    this.society_unAbilityPercentage = 0.0,
    this.support_isMoney = 0, // bool dynamic
    this.support_isProduct = 0, // bool dynamic
    this.isFollowUpFile = 0, // bool dynamic
    this.society_amount = 0.0,
    this.gps_latitude = '0',
    this.gps_longitude = '0',
    this.society_isOrphan = 0, // bool dynamic
    this.address,
    this.society_noOfDependents = 0.0,
    this.society_noOfGuaranteed = 0.0,
    this.society_sumExpense = 0.0,
    this.society_sumIncome = 0.0,
    this.society_diffrenceBetweenExpenseIncome = 0.0,
    this.society_SumExpenseIncomePerDependent = 0.0,
    this.isGiveHelpFromSociety = 0, // bool dynamic // Default valu
    this.apartmentNum,
    this.street_Arb,
    this.street_Eng,
    this.district_Arb,
    this.district_Eng,
    this.city_Arb,
    this.city_Eng,
    this.country_Arb = 'السعودية',
    this.country_Eng = 'Saudia',
    this.POBox,
    this.POBoxAdditionalNum,
    this.secondBusinessIDType,
    this.secondBusinessID,
    this.watch01_amount = 0.000000,
    this.watch02_amount = 0.000000,
    this.watch03_amount = 0.000000,
    this.watch04_amount = 0.000000,
    this.trainingHourseToBeGiven = 0.000000,
    this.trainingHourseLeft = 0.000000,
    this.cameFromIsPayedHisMoney = 0, // bool dynamic
    this.uiSource = 0,
    this.departmentJobNo = 0,
    // this.row_timestamp,
  });

  @override
  factory ClientVendor.fromJson(Map<String, dynamic> json) =>
      _$ClientVendorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClientVendorToJson(this);
}
