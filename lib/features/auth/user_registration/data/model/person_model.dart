import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/model/json_model.dart';

part 'person_model.g.dart';


@JsonSerializable()

class Person extends JsonModel {
  int VendorId;
  int personNo;
  String userNumber;
  dynamic parentNo;
  String aName;
  String? eName;
  String? shortName;
  dynamic nickName;
  dynamic birthDate;
  dynamic birthDateH;
  dynamic birthPlace;
  dynamic hafithaNo;
  dynamic hafithaSource;
  dynamic hafithaDate;
  dynamic hafithaDateH;
  dynamic personnelCardID;
  dynamic personnelCardBeginDate;
  dynamic personnelCardBeginDateH;
  dynamic personnelCardIdExpirationDate;
  dynamic personnelCardIdExpirationDateH;
  dynamic sex;
  dynamic specialty;
  String logger;
  String password1;
  String password2;
  dynamic passwordHash;
  dynamic passwordSalt;
  dynamic passwordDate;
  dynamic passportDateH;
  dynamic isDeleted;
  dynamic fileNo;
  dynamic finishDate;
  dynamic isFinished;
  dynamic academicSchoolPhase;
  dynamic academicSchoolYear;
  dynamic strClass;
  int? academicSchoolYearDegree;
  dynamic academicSchoolYearDegreeLevel;
  dynamic systemPhase;
  dynamic systemYear;
  dynamic passportNumber;
  dynamic passportDate;
  dynamic passportExpiryDate;
  dynamic passportExpiryDateH;
  dynamic bloodType;
  dynamic licineNumber;
  dynamic licineDate;
  dynamic carLicenseDateH;
  dynamic licineExpiryDate;
  dynamic carLicenseExpiryDateH;
  dynamic insuranceNumber;
  dynamic iqammaNumber;
  dynamic iqammaDate;
  dynamic iqammaDateH;
  dynamic iqammaExpiryDate;
  dynamic iqammaExpiryDateH;
  dynamic iqammaPlace;
  int? salary;
  dynamic isStaff;
  dynamic isTeacher;
  dynamic isStudent;
  dynamic fatherName;
  dynamic isDisabled;
  dynamic isUser;
  dynamic isFilterByBuilding;
  dynamic isOpenLevel1;
  dynamic isOpenLevel2;
  dynamic isOpenLevel3;
  dynamic isOpenLevel4;
  dynamic isOpenLevel5;
  dynamic isTrustedForLoan;
  dynamic isTrustedForBailing;
  int? maxLoanAmount;
  int? maxBailingAmount;
  dynamic isMarried;
  num? buildingNo;
  dynamic bankAccountNo;
  dynamic linkType;
  dynamic referenceNo;
  dynamic horizontalTreeNo;
  dynamic accountNo;
  int? maxBalanceAllowed;
  int? warnMaxBalance;
  int? minBalanceAllowed;
  int? warnMinBalance;
  dynamic governmentFileNo;
  dynamic isBeneficiaryFile;
  dynamic isHospitalFile;
  dynamic themeNo;
  dynamic companyNo;
  dynamic isBudgetPayer;
  dynamic isImportantToSchool;
  dynamic default_PrivilegeGroupNo;
  dynamic isDriver;
  dynamic isAgent;
  dynamic app_Lang;
  dynamic app_Data_Lang;
  dynamic isShowToolMenu;
  dynamic isJobApplier;
  dynamic isOfficial;
  dynamic religion;
  dynamic isFamily;
  dynamic passportAName;
  dynamic passportEName;
  dynamic passportPlace;
  dynamic borderEntranceNum;
  dynamic borderEntranceDate;
  dynamic borderEntranceDateH;
  dynamic currentJob;
  dynamic currentJobAsIn;
  dynamic currentJobExperiencePeriod;
  dynamic jobApplyDate;
  dynamic jobApplyDateH;
  dynamic jobStartDate;
  dynamic jobStartDateH;
  dynamic trainingCertificateType;
  dynamic personKafilNo;
  dynamic childrenCount;
  dynamic note;
  dynamic barCode;
  dynamic comp;
  dynamic domainName;
  dynamic appVersion;
  dynamic appPath;
  dynamic appLogInFailed;
  int? salaryAdd;
  dynamic carLicensePeriod;
  int? experienceTime;
  dynamic isAccessible;
  dynamic isAccessibleBy;
  dynamic oldAppPath;
  dynamic isAccessPublicAppFolder;
  dynamic appCopiedDate;
  dynamic appCopiedDateH;
  dynamic isCopiedLastVersion;
  dynamic isDeletedOldVersion;
  dynamic appIsUpdated;
  dynamic appLastRunnedPath;
  dynamic compIP;
  dynamic defaultPrivilegeGroupNo;
  dynamic formNo;
  dynamic isAdmin;
  dynamic isSmoking;
  dynamic e_mail;
  dynamic telephone;
  dynamic mobile;
  dynamic recordRestriction;
  dynamic currentJobNature;
  dynamic referenceReligiousMan;
  dynamic lastHajjYear;
  dynamic lastHajjYearLicense;
  dynamic hobbyBenefitHajj;
  dynamic mail;
  dynamic appsProgNo;
  dynamic metaFormCategoryNo;
  dynamic defaultLanguageNo;
  dynamic included;
  String? mainContact1;
  dynamic mainContact2;
  dynamic mainContact3;
  dynamic countryNo;
  dynamic volunteer_isApplied;
  dynamic volunteer_TypeNo;
  dynamic volunteer_section;
  dynamic volunteer_isPayment;
  num? volunteer_amount;
  dynamic volunteer_isWorker;
  dynamic socialStateNo;
  dynamic deathDateG;
  dynamic producingFamily_isWantsToApply;
  dynamic producingFamily_WantsToApplyDate;
  dynamic producingFamily_isJoined;
  dynamic producingFamily_JoinedDateG;
  dynamic isJobSeaker;
  dynamic jobSeakingDate;
  dynamic isHasJob;
  num? ageCalculatedGreg;
  dynamic isSocialInsurance;
  dynamic isBeneficiary;
  dynamic isInSchool;
  dynamic isOrphan;
  dynamic academicSchoolYearDegreeDateG;
  dynamic academicSchoolName;
  dynamic healthConditionNo;
  dynamic diseaseNameNo;
  dynamic society_isFamilyMainPerson;
  dynamic society_isResearcher;
  dynamic society_isAgent;
  dynamic society_isReceiver;
  dynamic society_isCertificateProvided;
  dynamic society_isGuaranteed;
  dynamic clientVendorNo;
  dynamic producingFamily_JoinedDate;
  dynamic hospitalOfPerson;
  dynamic isBloodDonatorForAnyPerson;
  dynamic isBloodHasBeenDonated;
  int? targetFunds;
  int? targetSales;
  dynamic isHasStock;
  num? commisionFunds;
  num? commisionSales;
  dynamic currentAddress;
  int? currentAge;
  dynamic currentJobCompany;
  dynamic nationality;
  dynamic saiedNo_previousHasband;
  dynamic isHide_Purchase_InAll;
  int? uiSource;
  int? departmentJobNo;
  dynamic ZATCA_B2C_NotIssuedDocuments_isRemind;
  dynamic ZATCA_B2C_NotIssuedDocumentsReminderInterval;

  Person({
    required this.VendorId,
    required this.personNo,
    required this.userNumber,
    this.parentNo,
    required this.aName,
     this.eName,
    this.shortName,
    this.nickName,
    this.birthDate,
    this.birthDateH,
    this.birthPlace,
    this.hafithaNo,
    this.hafithaSource,
    this.hafithaDate,
    this.hafithaDateH,
    this.personnelCardID,
    this.personnelCardBeginDate,
    this.personnelCardBeginDateH,
    this.personnelCardIdExpirationDate,
    this.personnelCardIdExpirationDateH,
    this.sex,
    this.specialty,
    required this.logger,
    required this.password1,
    required this.password2,
    this.passwordHash,
    this.passwordSalt,
    this.passwordDate,
    this.passportDateH,
    this.isDeleted,
    this.fileNo,
    this.finishDate,
    this.isFinished,
    this.academicSchoolPhase,
    this.academicSchoolYear,
    this.strClass,
    this.academicSchoolYearDegree,
    this.academicSchoolYearDegreeLevel,
    this.systemPhase,
    this.systemYear,
    this.passportNumber,
    this.passportDate,
    this.passportExpiryDate,
    this.passportExpiryDateH,
    this.bloodType,
    this.licineNumber,
    this.licineDate,
    this.carLicenseDateH,
    this.licineExpiryDate,
    this.carLicenseExpiryDateH,
    this.insuranceNumber,
    this.iqammaNumber,
    this.iqammaDate,
    this.iqammaDateH,
    this.iqammaExpiryDate,
    this.iqammaExpiryDateH,
    this.iqammaPlace,
    this.salary,
    this.isStaff,
    this.isTeacher,
    this.isStudent,
    this.fatherName,
    this.isDisabled,
    this.isUser,
    this.isFilterByBuilding,
    this.isOpenLevel1,
    this.isOpenLevel2,
    this.isOpenLevel3,
    this.isOpenLevel4,
    this.isOpenLevel5,
    this.isTrustedForLoan,
    this.isTrustedForBailing,
    this.maxLoanAmount,
    this.maxBailingAmount,
    this.isMarried,
    this.buildingNo,
    this.bankAccountNo,
    this.linkType,
    this.referenceNo,
    this.horizontalTreeNo,
    this.accountNo,
    this.maxBalanceAllowed,
    this.warnMaxBalance,
    this.minBalanceAllowed,
    this.warnMinBalance,
    this.governmentFileNo,
    this.isBeneficiaryFile,
    this.isHospitalFile,
    this.themeNo,
    this.companyNo,
    this.isBudgetPayer,
    this.isImportantToSchool,
    this.default_PrivilegeGroupNo,
    this.isDriver,
    this.isAgent,
    this.app_Lang,
    this.app_Data_Lang,
    this.isShowToolMenu,
    this.isJobApplier,
    this.isOfficial,
    this.religion,
    this.isFamily,
    this.passportAName,
    this.passportEName,
    this.passportPlace,
    this.borderEntranceNum,
    this.borderEntranceDate,
    this.borderEntranceDateH,
    this.currentJob,
    this.currentJobAsIn,
    this.currentJobExperiencePeriod,
    this.jobApplyDate,
    this.jobApplyDateH,
    this.jobStartDate,
    this.jobStartDateH,
    this.trainingCertificateType,
    this.personKafilNo,
    this.childrenCount,
    this.note,
    this.barCode,
    this.comp,
    this.domainName,
    this.appVersion,
    this.appPath,
    this.appLogInFailed,
    this.salaryAdd,
    this.carLicensePeriod,
    this.experienceTime,
    this.isAccessible,
    this.isAccessibleBy,
    this.oldAppPath,
    this.isAccessPublicAppFolder,
    this.appCopiedDate,
    this.appCopiedDateH,
    this.isCopiedLastVersion,
    this.isDeletedOldVersion,
    this.appIsUpdated,
    this.appLastRunnedPath,
    this.compIP,
    this.defaultPrivilegeGroupNo,
    this.formNo,
    this.isAdmin,
    this.isSmoking,
    this.e_mail,
    this.telephone,
    this.mobile,
    this.recordRestriction,
    this.currentJobNature,
    this.referenceReligiousMan,
    this.lastHajjYear,
    this.lastHajjYearLicense,
    this.hobbyBenefitHajj,
    this.mail,
    this.appsProgNo,
    this.metaFormCategoryNo,
    this.defaultLanguageNo,
    this.included,
    this.mainContact1,
    this.mainContact2,
    this.mainContact3,
    this.countryNo,
    this.volunteer_isApplied,
    this.volunteer_TypeNo,
    this.volunteer_section,
    this.volunteer_isPayment,
    this.volunteer_amount,
    this.volunteer_isWorker,
    this.socialStateNo,
    this.deathDateG,
    this.producingFamily_isWantsToApply,
    this.producingFamily_WantsToApplyDate,
    this.producingFamily_isJoined,
    this.producingFamily_JoinedDateG,
    this.isJobSeaker,
    this.jobSeakingDate,
    this.isHasJob,
    this.ageCalculatedGreg,
    this.isSocialInsurance,
    this.isBeneficiary,
    this.isInSchool,
    this.isOrphan,
    this.academicSchoolYearDegreeDateG,
    this.academicSchoolName,
    this.healthConditionNo,
    this.diseaseNameNo,
    this.society_isFamilyMainPerson,
    this.society_isResearcher,
    this.society_isAgent,
    this.society_isReceiver,
    this.society_isCertificateProvided,
    this.society_isGuaranteed,
    this.clientVendorNo,
    this.producingFamily_JoinedDate,
    this.hospitalOfPerson,
    this.isBloodDonatorForAnyPerson,
    this.isBloodHasBeenDonated,
    this.targetFunds,
    this.targetSales,
    this.isHasStock,
    this.commisionFunds,
    this.commisionSales,
    this.currentAddress,
    this.currentAge,
    this.currentJobCompany,
    this.nationality,
    this.saiedNo_previousHasband,
    this.isHide_Purchase_InAll,
    this.uiSource,
    this.departmentJobNo,
    this.ZATCA_B2C_NotIssuedDocuments_isRemind,
    this.ZATCA_B2C_NotIssuedDocumentsReminderInterval,
  });


  @override
  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonToJson(this);


}

