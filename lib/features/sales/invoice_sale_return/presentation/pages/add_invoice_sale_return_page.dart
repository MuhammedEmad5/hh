import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_button.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';
import 'package:InvoiceF/core/presentation/widgets/toast_notification.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/presentation/manager/invoice_sale_return_cubit.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/di/invoice_sell_service.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/colors.dart';

class AddInvoiceSaleReturnPage extends StatefulWidget {
  const AddInvoiceSaleReturnPage({super.key});

  @override
  State<AddInvoiceSaleReturnPage> createState() =>
      _AddInvoiceSaleReturnPageState();
}

class _AddInvoiceSaleReturnPageState extends State<AddInvoiceSaleReturnPage> {
  TextEditingController invoiceNo = TextEditingController();

  List<String> branchNames = ['Main Branch - الفرع الرئيسى'];
  List<int> buildingNumbers = [0];

  int buildingNo = 0;
  late InvoiceSellEntity invoiceData;
  Future<InvoiceSellEntity> getInvoiceData(
      String invoiceNo, int buildingNo) async {
    var res;
    try {
      res = await context
          .read<InvoiceSaleReturnCubit>()
          .getInvoiceData(invoiceNo, '$buildingNo', 'InvoiceSell');
    } catch (e) {
      showToast(
          context: context, message: AppLocalizations.of(context)!.failed_a4);
    }

    return res;
  }

  void getBranches() async {
    var res = await context.read<InvoiceSaleReturnCubit>().getBranches();
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
            '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.sell_invoice_return}',
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
                              .read<InvoiceSaleReturnCubit>()
                              .getLastIndex();
                          InvoiceSellService().initDi();
                          AppNavigation.push(
                            SellInvoiceDetailsPage(
                              newIndex: invoiceData.invoiceNo,
                              data: invoiceData,
                              isEdit: true,
                              isAddInvoiceReturn: true,
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
