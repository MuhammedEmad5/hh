import 'dart:io';

import 'package:InvoiceF_Sales/core/navigation/navigation.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/data_grid_paginated.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_Sales/core/utils/logger.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/presentation/manager/invoice_sale_return_cubit.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/presentation/pages/add_invoice_sale_return_page.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/di/invoice_sell_service.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class InvoiceSaleReturnListPage extends StatefulWidget {
  const InvoiceSaleReturnListPage({super.key});

  @override
  State<InvoiceSaleReturnListPage> createState() =>
      _InvoiceSaleReturnListPageState();
}

class _InvoiceSaleReturnListPageState extends State<InvoiceSaleReturnListPage> {
  Future<InvoiceSellEntity> getInvoiceData(
      String invoiceNo, String buildingNo) async {
    var res = await context
        .read<InvoiceSaleReturnCubit>()
        .getInvoiceData(invoiceNo, buildingNo, 'invoiceSellReturn');
    return res;
  }

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    if (context.read<InvoiceSaleReturnCubit>().isClosed) {
      LoggerSingleton.logger.i('The Bloc is closed.');
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.sell_invoice_return,
        onAddPressed: () {
          AppNavigation.pushPageRoute(
            buildPageRoute(
              builder: (context) {
                return RepositoryProvider(
                    create: (context) => GetIt.I<InvoiceSaleReturnRepo>(),
                    child: BlocProvider<InvoiceSaleReturnCubit>.value(
                      value: GetIt.I<InvoiceSaleReturnCubit>()
                        ..getAllInvoiceSalesReturn(),
                      child: const AddInvoiceSaleReturnPage(),
                    ));
              },
            ),
          );
        },
      ),
      body: BlocBuilder<InvoiceSaleReturnCubit, InvoiceSaleReturnState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Text('Initial State');
          }, loading: () {
            return Center(child: Loader());
          }, success: (data) {
            return ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: DataGridPaginated(
                    onEditPressed: (itemData) async {
                      var inv = await getInvoiceData(
                          itemData.invoiceNo.toString(),
                          itemData.buildingNo.toString());
                      InvoiceSellService().initDi();
                      AppNavigation.push(
                        SellInvoiceDetailsPage(
                          newIndex: itemData.invoiceNo.round(),
                          data: inv,
                          isEdit: true,
                          disableSave: true,
                        ),
                      );
                    },
                    onDeletePressed: (id) {
                      context
                          .read<InvoiceSaleReturnCubit>()
                          .deleteInvoiceSaleReturn(id: id);
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
