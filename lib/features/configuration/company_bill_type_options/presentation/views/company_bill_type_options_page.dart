import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/form_navigation.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/domain/entities/company_bill_type_entity/company_bill_type_entity_model.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/presentation/manager/company_bill_type_options_cubit.dart';
import 'package:InvoiceF/features/configuration/company_bill_type_options/presentation/widgets/company_bill_type_card.dart';

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

  List<DropdownMenuItem> defaultReportList = [
    const DropdownMenuItem(value: 0, child: Text('A4')),
    const DropdownMenuItem(value: 1, child: Text('80mm')),
  ];
  List<DropdownMenuItem> printingTypeOnPostList = [
    DropdownMenuItem(
        value: 0,
        child: Text(
            AppLocalizations.of(AppNavigation.context)!.print_main_report)),
    DropdownMenuItem(
        value: 1,
        child: Text(
            AppLocalizations.of(AppNavigation.context)!.preview_main_report)),
    DropdownMenuItem(
        value: 2,
        child: Text(AppLocalizations.of(AppNavigation.context)!
            .print_all_selected_reports)),
    DropdownMenuItem(
        value: 3,
        child: Text(AppLocalizations.of(AppNavigation.context)!
            .preview_all_selected_reports)),
    DropdownMenuItem(
        value: 4,
        child: Text(AppLocalizations.of(AppNavigation.context)!
            .show_report_selection_wifi)),
    DropdownMenuItem(
        value: 5,
        child: Text(AppLocalizations.of(AppNavigation.context)!.do_nothing)),
  ];
  List<DropdownMenuItem> vatTypeList = [
    DropdownMenuItem(
        value: 0,
        child: Text(AppLocalizations.of(AppNavigation.context)!.tax_report)),
    DropdownMenuItem(
        value: 1,
        child: Text(
            AppLocalizations.of(AppNavigation.context)!.standard_rated_sales)),
    DropdownMenuItem(
        value: 2,
        child: Text(AppLocalizations.of(AppNavigation.context)!
            .citizen_rate_healthcare)),
  ];

  List<DropdownMenuItem> vatGroupList = [
    DropdownMenuItem(
        value: 0,
        child: Text(AppLocalizations.of(AppNavigation.context)!.tax_report)),
    DropdownMenuItem(
        value: 1,
        child: Text(
            AppLocalizations.of(AppNavigation.context)!.standard_rated_sales)),
    DropdownMenuItem(
        value: 2,
        child: Text(AppLocalizations.of(AppNavigation.context)!.sales_exports)),
    DropdownMenuItem(
        value: 3,
        child: Text(
          AppLocalizations.of(AppNavigation.context)!.exempts_sales,
        ))
  ];

  TextEditingController reference = TextEditingController();
  CustomDropdownController printingTypeC = CustomDropdownController();
  CustomDropdownController defaultReportC = CustomDropdownController();
  CustomDropdownController vatTypeC = CustomDropdownController();
  CustomDropdownController vatGroupC = CustomDropdownController();
  TextEditingController reportUHAC = TextEditingController();
  TextEditingController reportUHEC = TextEditingController();
  TextEditingController reportUDSC = TextEditingController();

  void updateTextFields(CompanyBillTypeEntity cBillType) {
    reference.text = '${cBillType.billTypeNo}';
    if (printingTypeOnPostList.indexWhere(
            (element) => element.value == cBillType.report_OnPostTypeNo) !=
        -1) {
      printingTypeC.setValue(cBillType.report_OnPostTypeNo);
    }
    // defaultReportC.setValue(defaultReportList[cBillType.])
    if (vatTypeList
            .indexWhere((element) => element.value == cBillType.VATTypeNo) !=
        -1) {
      vatTypeC.setValue(cBillType.VATTypeNo);
    }
    if (vatGroupList
            .indexWhere((element) => element.value == cBillType.VATGroupNo) !=
        -1) {
      vatGroupC.setValue(cBillType.VATGroupNo);
    }
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
      VATGroupNo: vatGroupC.value,
      VATTypeNo: vatTypeC.value,
      reportUnderDataStatement: reportUDSC.text,
      reportUnderHeader: reportUHAC.text,
      reportUnderHeader_En: reportUHEC.text,
      report_OnPostTypeNo: printingTypeC.value,
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
              return CustomEmptyWidget(
                text: AppLocalizations.of(context)!.no_db_available,
              );
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
