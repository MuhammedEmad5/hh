import 'package:InvoiceF_ClientVendor/core/constants/colors.dart';
import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/client_vendor_entity/client_vendor_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell/invoice_sell_model.dart';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/invoice_a4/presentation/manager/invoice_a4_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_a4_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/pdf_create_a4_invoice.dart';

class InvoiceA4Page extends StatefulWidget {
  const InvoiceA4Page({super.key});

  @override
  State<InvoiceA4Page> createState() => _InvoiceA4PageState();
}

class _InvoiceA4PageState extends State<InvoiceA4Page> {
  int type = 0;
  List<String> invoiceTypes = [
    AppLocalizations.of(AppNavigation.context)!.pos_sell_invoice,
    AppLocalizations.of(AppNavigation.context)!.purchase_invoice,
    AppLocalizations.of(AppNavigation.context)!.sell_invoice_return,
    AppLocalizations.of(AppNavigation.context)!.purchase_invoice_return,
  ];
  TextEditingController invoiceNoC = TextEditingController();
  late InvoiceSell invoiceData;
  late ClientVendorEntity clientVendorData;
  late ClientVendorEntity companyData;
  List<InvoiceSellUnitEntity> invoiceSellUnits = [];
  List<String> branchNames = ['Main Branch - الفرع الرئيسى'];
  List<int> buildingNumbers = [0];
  int buildingNo = 0;
  bool isLoading = true;

  String get tableName {
    switch (type) {
      case 0:
        return 'InvoiceSell';
      case 1:
        return 'InvoiceBuy';
      case 2:
        return 'InvoiceSellReturn';
      case 3:
        return 'InvoiceBuyReturn';
      default:
        return 'InvoiceSell';
    }
  }

  String get itemsTableName {
    switch (type) {
      case 0:
        return 'InvoiceSellUnit';
      case 1:
        return 'InvoiceBuyUnit';
      case 2:
        return 'InvoiceSellReturnUnit';
      case 3:
        return 'InvoiceBuyReturnUnit';
      default:
        return 'InvoiceSellUnit';
    }
  }

  void getBranches() async {
    var res = await context.read<InvoiceA4Cubit>().getBranches();
    setState(() {
      branchNames = res[0];
      buildingNumbers = res[1];
      isLoading = false;
    });
  }

  Future createPdfFromData() async {
    try {
      await context
          .read<InvoiceA4Cubit>()
          .getData(invoiceNoC.text, '$buildingNo', tableName, itemsTableName)
          .then((value) {});
      await createA4InvoicePdf(
          type, invoiceSellUnits, clientVendorData, invoiceData, companyData);
      AppNavigation.push(const A4ReportPage());
    } catch (e) {
      if (context.mounted) {
        showToast(
            context: context, message: AppLocalizations.of(context)!.failed_a4);
      }
    }
  }

  bool dataSuccess = false;

  @override
  void initState() {
    super.initState();
    getBranches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.invoice_A4,
        textColor: AppColors.onPrimary,
        color: AppColors.primaryColor,
      ),
      body: BlocBuilder<InvoiceA4Cubit, InvoiceA4State>(
        builder: (context, state) {
          if (state is A4DataFetched) {
            companyData = state.data['company'];
            clientVendorData = state.data['clientVendor'];
            invoiceData = state.data['invoice'];
            invoiceSellUnits = state.data['items'];
          }
          return isLoading
              ? Loader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DropDown(
                        items: invoiceTypes,
                        onChanged: (value) {
                          type = invoiceTypes.indexOf(value);
                        },
                        initialValue:
                            AppLocalizations.of(context)!.pos_sell_invoice,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropDown(
                        items: branchNames,
                        initialValue: branchNames[0],
                        onChanged: (value) {
                          buildingNo =
                              buildingNumbers[branchNames.indexOf(value)];
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextBox(
                        hint: AppLocalizations.of(context)!.invoiceNo,
                        controller: invoiceNoC,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            text: AppLocalizations.of(context)!.cancel,
                            onPressed: () {
                              AppNavigation.pop();
                            },
                            isExpanded: false,
                          ),
                          CustomButton(
                            text: AppLocalizations.of(context)!.view,
                            onPressed: () async {
                              await createPdfFromData();
                            },
                            isExpanded: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
