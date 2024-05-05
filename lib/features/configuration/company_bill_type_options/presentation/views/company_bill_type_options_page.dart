import 'package:InvoiceF_Configuration/core/navigation/navigation.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/form_navigation.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_Configuration/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF_Configuration/features/configuration/company_bill_type_options/domain/entities/company_bill_type_entity/company_bill_type_entity_model.dart';
import 'package:InvoiceF_Configuration/features/configuration/company_bill_type_options/presentation/manager/company_bill_type_options_cubit.dart';
import 'package:InvoiceF_Configuration/features/configuration/company_bill_type_options/presentation/widgets/company_bill_type_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';

class CompanyBillTypeOptionsPage extends StatefulWidget {
  const CompanyBillTypeOptionsPage({super.key});

  @override
  State<CompanyBillTypeOptionsPage> createState() =>
      _CompanyBillTypeOptionsPageState();
}

class _CompanyBillTypeOptionsPageState
    extends State<CompanyBillTypeOptionsPage> {
  List<CompanyBillTypeEntity> cBillTypesData = [];
  int lastIndex = 1;
  List<int> addedIndexs = [];
  int currentIndex = 1;

  List<String> defaultReportList = ['A4', '80mm'];
  List<String> printingTypeOnPostList = [
    AppLocalizations.of(AppNavigation.context)!.print_main_report,
    AppLocalizations.of(AppNavigation.context)!.preview_main_report,
    AppLocalizations.of(AppNavigation.context)!.print_all_selected_reports,
    AppLocalizations.of(AppNavigation.context)!.preview_all_selected_reports,
    AppLocalizations.of(AppNavigation.context)!.show_report_selection_wifi,
    AppLocalizations.of(AppNavigation.context)!.do_nothing,
  ];
  List<String> vatTypeList = [
    AppLocalizations.of(AppNavigation.context)!.tax_report,
    AppLocalizations.of(AppNavigation.context)!.standard_rated_sales,
    AppLocalizations.of(AppNavigation.context)!.citizen_rate_healthcare,
    // AppLocalizations.of(AppNavigation.context)!.tax_report,
  ];
  List<String> vatGroupList = [
    AppLocalizations.of(AppNavigation.context)!.tax_report,
    AppLocalizations.of(AppNavigation.context)!.standard_rated_sales,
    AppLocalizations.of(AppNavigation.context)!.sales_exports,
    AppLocalizations.of(AppNavigation.context)!.exempts_sales,
  ];

  TextEditingController reference = TextEditingController();
  DropDownController printingTypeC = DropDownController();
  DropDownController defaultReportC = DropDownController();
  DropDownController vatTypeC = DropDownController();
  DropDownController vatGroupC = DropDownController();
  TextEditingController reportUHAC = TextEditingController();
  TextEditingController reportUHEC = TextEditingController();
  TextEditingController reportUDSC = TextEditingController();

  void updateTextFields(CompanyBillTypeEntity cBillType) {
    reference.text = '${cBillType.billTypeNo}';
    printingTypeC.setValue(cBillType.report_OnPostTypeNo != null
        ? printingTypeOnPostList[cBillType.report_OnPostTypeNo!]
        : null);
    // defaultReportC.setValue(defaultReportList[cBillType.])
    vatTypeC.setValue(
        cBillType.VATTypeNo != null ? vatTypeList[cBillType.VATTypeNo!] : null);
    vatGroupC.setValue(cBillType.VATTypeNo != null
        ? vatGroupList[cBillType.VATGroupNo!]
        : null);
    reportUHAC.text = '${cBillType.reportUnderHeader}';
    reportUHEC.text = '${cBillType.reportUnderHeader_En}';
    reportUDSC.text = '${cBillType.reportUnderDataStatement}';
  }

  @override
  void dispose() {
    super.dispose();
  }

  handleSave() {
    CompanyBillTypeEntity cBillType = CompanyBillTypeEntity(
      billTypeNo: cBillTypesData[currentIndex - 1].billTypeNo,
      VATGroupNo: vatGroupList.indexOf(vatGroupC.value),
      VATTypeNo: vatTypeList.indexOf(vatTypeC.value),
      reportUnderDataStatement: reportUDSC.text,
      reportUnderHeader: reportUHAC.text,
      reportUnderHeader_En: reportUHEC.text,
      report_OnPostTypeNo: printingTypeOnPostList.indexOf(printingTypeC.value),
    );
    cBillTypesData[currentIndex - 1] = cBillType;
    context
        .read<CompanyBillTypeCubit>()
        .updateCompanyBillType(companyBillType: cBillType);

    showToast(context: context, message: AppLocalizations.of(context)!.success);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.company_bill_type_Options,
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        onSavePressed: () {
          handleSave();
        },
        addBtnColor: AppColors.onPrimary,
      ),
      body: BlocBuilder<CompanyBillTypeCubit, CompanyBillTypeState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return Center(child: Loader());
          }, success: (data) {
            if (data.isEmpty) {
              //TODO: Handle empty
            }
            cBillTypesData = data.isEmpty ? cBillTypesData : data;
            lastIndex =
                cBillTypesData.isNotEmpty ? cBillTypesData.last.billTypeNo : 0;

            if (currentIndex == 1 && cBillTypesData.isNotEmpty) {
              updateTextFields(cBillTypesData[0]);
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: CompanyBillTypeCard(
                      reference: reference,
                      defaultReportList: defaultReportList,
                      printingTypeOnPostList: printingTypeOnPostList,
                      vatGroupList: vatGroupList,
                      vatTypeList: vatTypeList,
                      printingTypeC: printingTypeC,
                      defaultReportC: defaultReportC,
                      reportUDSC: reportUDSC,
                      reportUHAC: reportUHAC,
                      reportUHEC: reportUHEC,
                      vatGroupC: vatGroupC,
                      vatTypeC: vatTypeC,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FormNavigation(
                    length: cBillTypesData.length,
                    pagerIndex: currentIndex,
                    setPagerIndex: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    onChanged: (index) {
                      setState(() {
                        updateTextFields(cBillTypesData[index - 1]);
                      });
                    },
                  ),
                ),
              ],
            );
          }, error: (e) {
            return CustomErrorWidget(errorMessage: e);
          }, empty: () {
            return const CustomEmptyWidget(
              text: 'No Company Unit available please insert one',
            );
          });
        },
      ),
    );
  }
}
