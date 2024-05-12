import 'package:InvoiceF/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/enums/connection_enum.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/bottom_tab_bar.dart';
import '../../../../../core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/date_picker_with_controller/date_picker_controller.dart';
import '../../../../../core/presentation/widgets/form_navigation.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/entities/company_general_entity/company_entity.dart';
import '../manager/company_cubit.dart';
import '../widgets/company_gatz_form_container.dart';
import '../widgets/company_general_form_container.dart';
import '../widgets/company_general_second_form_container.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});
  //todo handle bool and image

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView>
    with TickerProviderStateMixin {
  ///General 1
  late TabController tabController;
  late TextEditingController businessNoController;
  late TextEditingController companyNoController;
  late TextEditingController arabicNameController;
  late TextEditingController englishNameController;
  late DatePickerController establishDateController;

  late TextEditingController telephone1Controller;
  late TextEditingController addressController;

  ///General 2
  late TextEditingController telephone2Controller;
  late TextEditingController officialEnglishNameController;
  late TextEditingController officialArabicNameController;
  late TextEditingController targetController;
  late TextEditingController noteController;
  late CustomCheckboxController showHeaderInfoReportController;
  late CustomCheckboxController includeBranchNameController;

  ///GAZT
  late TextEditingController buildingNoController;
  late TextEditingController additionalNoController;
  late TextEditingController postalController;
  late TextEditingController streetNameEnglishController;
  late TextEditingController streetNameArabicController;
  late TextEditingController districtEnglishController;
  late TextEditingController districtArabicController;
  late TextEditingController cityArabicController;
  late TextEditingController cityEnglishController;
  late TextEditingController countryEnglishController;
  late TextEditingController countryArabicController;
  late TextEditingController secondBusinessIdController;
  late TextEditingController secondBusinessIdTypeController;
  late CustomCheckboxController useDifferentLogoController;

  late AppLocalizations appLocalizations;

  List<CompanyEntity> companiesList = [];

  bool isNewCompany = false;

  @override
  void initState() {
    super.initState();

    businessNoController = TextEditingController();
    companyNoController = TextEditingController();
    arabicNameController = TextEditingController();
    englishNameController = TextEditingController();
    establishDateController = DatePickerController(null);
    telephone1Controller = TextEditingController();
    addressController = TextEditingController();
    telephone2Controller = TextEditingController();
    officialEnglishNameController = TextEditingController();
    officialArabicNameController = TextEditingController();
    targetController = TextEditingController();
    noteController = TextEditingController();
    buildingNoController = TextEditingController();
    additionalNoController = TextEditingController();
    postalController = TextEditingController();
    streetNameEnglishController = TextEditingController();
    streetNameArabicController = TextEditingController();
    districtEnglishController = TextEditingController();
    districtArabicController = TextEditingController();
    cityArabicController = TextEditingController();
    cityEnglishController = TextEditingController();
    countryEnglishController = TextEditingController();
    countryArabicController = TextEditingController();
    secondBusinessIdController = TextEditingController();
    secondBusinessIdTypeController = TextEditingController();
    showHeaderInfoReportController = CustomCheckboxController(false);
    includeBranchNameController = CustomCheckboxController(false);
    useDifferentLogoController = CustomCheckboxController(false);

    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    businessNoController.dispose();
    companyNoController.dispose();
    arabicNameController.dispose();
    englishNameController.dispose();
    establishDateController.dispose();
    telephone1Controller.dispose();
    addressController.dispose();
    telephone2Controller.dispose();
    officialEnglishNameController.dispose();
    officialArabicNameController.dispose();
    targetController.dispose();
    noteController.dispose();
    buildingNoController.dispose();
    additionalNoController.dispose();
    postalController.dispose();
    streetNameEnglishController.dispose();
    streetNameArabicController.dispose();
    districtEnglishController.dispose();
    districtArabicController.dispose();
    cityArabicController.dispose();
    cityEnglishController.dispose();
    countryEnglishController.dispose();
    countryArabicController.dispose();
    secondBusinessIdController.dispose();
    secondBusinessIdTypeController.dispose();
    showHeaderInfoReportController.dispose();
    includeBranchNameController.dispose();
    useDifferentLogoController.dispose();
  }

  void updateTextFields(CompanyEntity company) {
    businessNoController.text = company.businessRegistrationNo == null
        ?company.companyNo.toString()
        : company.businessRegistrationNo.toString();
    companyNoController.text = company.companyNo.toString();
    arabicNameController.text = company.arabicName;
    englishNameController.text = company.englishName;
    establishDateController.value = DateTime.tryParse(company.dateOfEstablishment ?? "");
    telephone1Controller.text = company.telephone1 ?? "";
    addressController.text = company.address ?? "";
    telephone2Controller.text = company.telephone2 ?? "";
    officialEnglishNameController.text = company.officialEnglishName ?? "";
    officialArabicNameController.text = company.officialArabicName ?? "";
    targetController.text = company.target ?? "";
    noteController.text = company.note ?? "";
    buildingNoController.text = company.buildingNo?.toString() ?? "";
    additionalNoController.text = company.additionalNo?.toString() ?? "";
    postalController.text = company.postalCode ?? "";
    streetNameEnglishController.text = company.streetNameEnglish ?? "";
    streetNameArabicController.text = company.streetNameArabic ?? "";
    districtEnglishController.text = company.districtEnglish ?? "";
    districtArabicController.text = company.districtArabic ?? "";
    cityArabicController.text = company.cityArabic ?? "";
    cityEnglishController.text = company.cityEnglish ?? "";
    countryEnglishController.text = company.countryEnglish ?? "";
    countryArabicController.text = company.countryArabic ?? "";
    secondBusinessIdController.text = company.secondBusinessID ?? "";
    secondBusinessIdTypeController.text =
        company.secondBusinessIDType?.toString() ?? "";
    //todo error in initial insert local case retrive
    if (context.read<ConnectionTypeBloc>().state.connection == ConnectionEnum.server){
      showHeaderInfoReportController.value =
          company.showHeaderInfoInReports ?? false;
      includeBranchNameController.value = company.includeBranchName ?? false;
      /// int from 5
      useDifferentLogoController.value = company.isUseDifferentLogoForA4 ?? false;
    }

  }

  void addNew() {
    isNewCompany = true;
    setState(() {
      final newCompany = CompanyEntity(
          companyNo: companiesList.length + 1,
          arabicName: '',
          englishName: '',
          businessRegistrationNo: (companiesList.length + 1).toString());
      companiesList.add(newCompany);
      updateTextFields(newCompany);
    });
  }

  void resetAll() {}

  void delete(String id) {}

  void handleSuccess(List<CompanyEntity> companies) {
    if (companiesList.isEmpty) {
      isNewCompany = true;
      updateTextFields(
          CompanyEntity(companyNo: 1, arabicName: '', englishName: ''));
      return;
    }

    if (!isNewCompany) {
      updateTextFields(companiesList[0]);
    }
  }

  void onSubmit() {
    final CompanyEntity companyEntity = CompanyEntity(
        companyNo: num.parse(companyNoController.text),
        arabicName: arabicNameController.text,
        englishName: englishNameController.text,
        dateOfEstablishment:context.formatDateString(establishDateController.value.toString()),
        telephone1: telephone1Controller.text,
        address: addressController.text,
        telephone2: telephone2Controller.text,
        officialArabicName: officialArabicNameController.text,
        officialEnglishName: officialEnglishNameController.text,
        showHeaderInfoInReports: showHeaderInfoReportController.value ? 1 : 0,
        includeBranchName: includeBranchNameController.value ? 1 : 0,
        target: targetController.text,
        note: noteController.text,
        buildingNo: buildingNoController.text,
        additionalNo: additionalNoController.text,
        postalCode: postalController.text,
        streetNameEnglish: streetNameEnglishController.text,
        streetNameArabic: streetNameArabicController.text,
        districtEnglish: districtEnglishController.text,
        districtArabic: districtArabicController.text,
        cityArabic: cityArabicController.text,
        cityEnglish: cityEnglishController.text,
        countryEnglish: countryEnglishController.text,
        countryArabic: countryArabicController.text,
        secondBusinessID: secondBusinessIdController.text,

        /// will be drop down values
        secondBusinessIDType: 0,
        isUseDifferentLogoForA4: useDifferentLogoController.value ? 1 : 0
        // todo image upload ?
        // companyIconLocation80mm: null,
        // companyIconLocationA4: null,

        );

    isNewCompany
        ? context.read<CompanyCubit>().insertBranch(companyEntity)
        : context.read<CompanyCubit>().updateBranch(companyEntity);
    isNewCompany = false;
  }

  void validateInput() {
    final validator = Validator(context);
    final validateName =
        validator.validate(arabicNameController.text.trim(),appLocalizations.arabic_name);

    if (validateName != null) {
      showToast(
        duration: 4, //Optional in seconds
        context: context,
        message: validateName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }

    onSubmit();
  }

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.company,
        onSavePressed: () => validateInput(),
        // onAddPressed: () => addNew(),
        //addBtnColor: AppColors.primaryColor,
        saveBtnColor: Colors.white,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
      body:  BlocBuilder<CompanyCubit, CompanyState>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () =>  Center(child: Loader()),
              success: (data) {
                companiesList = data;
                handleSuccess(companiesList);

                return Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          CompanyGeneralFormContainer(
                            businessNoController: businessNoController,
                            companyNoController: companyNoController,
                            arabicNameController: arabicNameController,
                            englishNameController: englishNameController,
                            establishDatePickerController: establishDateController,
                            telephone1Controller: telephone1Controller,
                            addressController: addressController,
                          ),
                          CompanyGeneralSecondFormContainer(
                            telephone2Controller: telephone2Controller,
                            officialEnglishNameController:
                                officialEnglishNameController,
                            officialArabicNameController:
                                officialArabicNameController,
                            targetController: targetController,
                            noteController: noteController,
                            showHeaderInfoReportController:
                                showHeaderInfoReportController,
                            includeBranchNameController:
                                includeBranchNameController,
                          ),
                          CompanyGAZTFormContainer(
                            buildingNoController: buildingNoController,
                            additionalNoController: additionalNoController,
                            postalController: postalController,
                            cityArabicController: cityArabicController,
                            streetNameEnglishController:
                                streetNameEnglishController,
                            streetNameArabicController:
                                streetNameArabicController,
                            districtEnglishController:
                                districtEnglishController,
                            districtArabicController: districtArabicController,
                            cityEnglishController: cityEnglishController,
                            countryEnglishController: countryEnglishController,
                            countryArabicController: countryArabicController,
                            secondBusinessIdController:
                                secondBusinessIdController,
                            secondBusinessIdTypeController:
                                secondBusinessIdTypeController,
                            useDifferentLogoController:
                                useDifferentLogoController,
                          ),
                        ],
                      ),
                    ),
                    BottomTabBar(
                      items:  [appLocalizations.general1, appLocalizations.general2, appLocalizations.gazt],
                      tabController: tabController,
                    ),
                    // FormNavigation(
                    //   length: companiesList.length,
                    //   onChanged: (index) {
                    //     updateTextFields(companiesList[index - 1]);
                    //   },
                    // ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
              error: (e) => CustomErrorWidget(
                    errorMessage: e,
                  ));
        },
      ),
    );
  }
}
