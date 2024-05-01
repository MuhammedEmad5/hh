import 'dart:io';
import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/data_grid_paginated.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_ClientVendor/core/utils/logger.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/di/invoice_buy_service.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/pages/purchase_invoice_details_page.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/manager/purchase_return_invoice_cubit.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/pages/add_purchase_return_invoice_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class PurchaseReturnInvoiceListPage extends StatefulWidget {
  const PurchaseReturnInvoiceListPage({super.key});

  @override
  State<PurchaseReturnInvoiceListPage> createState() =>
      _PurchaseReturnInvoiceListPageState();
}

class _PurchaseReturnInvoiceListPageState
    extends State<PurchaseReturnInvoiceListPage> {
  Future<InvoiceBuyEntity> getInvoiceData(
      String invoiceNo, String buildingNo) async {
    var res = await context
        .read<PurchaseReturnInvoiceCubit>()
        .getInvoiceData(invoiceNo, buildingNo, 'InvoiceBuyReturn');
    return res;
  }

  Route buildPageRoute({
    required WidgetBuilder builder,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: builder,
          )
        : MaterialPageRoute(
            builder: builder,
          );
  }

  @override
  void initState() {
    super.initState();
  }

  int newIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (context.read<PurchaseReturnInvoiceCubit>().isClosed) {
      LoggerSingleton.logger.i('The Bloc is closed.');
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.purchase_invoice_return,
        onAddPressed: () {
          AppNavigation.pushPageRoute(
            buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<PurchaseReturnInvoiceState>(),
                    child: BlocProvider<PurchaseReturnInvoiceCubit>.value(
                      value: GetIt.I<PurchaseReturnInvoiceCubit>()
                        ..getAllPurchaseReturnInvoice(),
                      child: const AddPurchaseReturnInvoicePage(),
                    ));
              },
            ),
          );
        },
      ),
      body: BlocBuilder<PurchaseReturnInvoiceCubit, PurchaseReturnInvoiceState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return Center(child: Loader());
          }, success: (data) {
            return ListView(
              children: [
                data == []
                    ? Text('No Records')
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: DataGridPaginated(
                          onEditPressed: (itemData) async {
                            var inv = await getInvoiceData(
                                itemData.invoiceNo.toString(),
                                itemData.buildingNo.toString());
                            InvoiceBuyService().initDi();
                            AppNavigation.push(
                              AddBuyInvoicePage(
                                newIndex: itemData.invoiceNo.round(),
                                data: inv,
                                isEdit: true,
                                disableSave: true,
                              ),
                            );
                          },
                          onDeletePressed: (id) {
                            context
                                .read<PurchaseReturnInvoiceCubit>()
                                .deletePurchaseReturnInvoice(id: id);
                            data.removeWhere(
                                (element) => element.clientVendorNo == id);
                            showOKDialog(
                              context: context,
                              title: AppLocalizations.of(context)!.success,
                              message: '',
                            );
                          },
                          data: data,
                          allowFiltering: true,
                          fill: Platform.isLinux ||
                              Platform.isMacOS ||
                              Platform.isWindows,
                        ),
                      ),
              ],
            );
          }, error: (e) {
            return CustomErrorWidget(errorMessage: e);
          }, empty: () {
            return CustomEmptyWidget(
              text: AppLocalizations.of(context)!.no_data,
            );
          });
        },
      ),
    );
  }
}
