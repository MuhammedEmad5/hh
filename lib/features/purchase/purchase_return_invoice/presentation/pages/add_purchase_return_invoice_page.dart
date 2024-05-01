import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/di/invoice_buy_service.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/pages/purchase_invoice_details_page.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/manager/purchase_return_invoice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';

class AddPurchaseReturnInvoicePage extends StatefulWidget {
  const AddPurchaseReturnInvoicePage({super.key});

  @override
  State<AddPurchaseReturnInvoicePage> createState() =>
      _AddPurchaseReturnInvoicePageState();
}

class _AddPurchaseReturnInvoicePageState
    extends State<AddPurchaseReturnInvoicePage> {
  TextEditingController invoiceNo = TextEditingController();

  List<String> branchNames = ['Main Branch - الفرع الرئيسى'];
  List<int> buildingNumbers = [0];

  int buildingNo = 0;

  late InvoiceBuyEntity invoiceData;
  Future<InvoiceBuyEntity> getInvoiceData(
      String invoiceNo, int buildingNo) async {
    var res;
    try {
      res = await context
          .read<PurchaseReturnInvoiceCubit>()
          .getInvoiceData(invoiceNo, '$buildingNo', 'InvoiceBuy');
    } catch (e) {
      showToast(
          context: context, message: AppLocalizations.of(context)!.failed_a4);
    }
    return res;
  }

  void getBranches() async {
    var res = await context.read<PurchaseReturnInvoiceCubit>().getBranches();
    setState(() {
      branchNames = res[0];
      buildingNumbers = res[1];
      isLoading = false;
    });
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getBranches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.purchase_invoice_return}',
        textColor: AppColors.onPrimary,
        color: AppColors.primaryColor,
      ),
      body: isLoading
          ? Loader()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropDown(
                    items: branchNames,
                    initialValue: branchNames[0],
                    label: AppLocalizations.of(context)!.branch,
                    onChanged: (value) {
                      buildingNo = buildingNumbers[branchNames.indexOf(value)];
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    hint: AppLocalizations.of(context)!.invoiceNo,
                    isNumberBox: true,
                    controller: invoiceNo,
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
                          invoiceData =
                              await getInvoiceData(invoiceNo.text, buildingNo);
                          var lastIndex = await context
                              .read<PurchaseReturnInvoiceCubit>()
                              .getLastIndex();
                          InvoiceBuyService().initDi();
                          AppNavigation.push(
                            AddBuyInvoicePage(
                              newIndex: invoiceData.invoiceNo,
                              data: invoiceData,
                              isEdit: true,
                              isAddPurchaseReturnInvoice: true,
                              newIndexReturn: lastIndex,
                            ),
                          );
                        },
                        isExpanded: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
