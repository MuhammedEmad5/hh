import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../../core/enums/connection_enum.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/data_grid_paginated.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/ok_alert.dart';
import '../../../../../core/utils/logger.dart';
import '../../../pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import '../../../pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';
import '../manager/invoice_sale_return_cubit.dart';
import 'add_invoice_sale_return_page.dart';

class InvoiceSaleReturnListPage extends StatefulWidget {
  const InvoiceSaleReturnListPage({super.key});

  @override
  State<InvoiceSaleReturnListPage> createState() =>
      _InvoiceSaleReturnListPageState();
}

class _InvoiceSaleReturnListPageState extends State<InvoiceSaleReturnListPage> {
  late IConnection connection;
  Future<InvoiceSellEntity> getInvoiceData(String invoiceNo) async {
    var response = await connection
        .readQuery('SELECT * FROM invoicesell WHERE invoiceNo = $invoiceNo');
    return InvoiceSellEntity.fromJson(response[0]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    connection = context.read<ConnectionTypeBloc>().state.connection ==
            ConnectionEnum.local
        ? LocalConnection()
        : RemoteConnection();
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
          AppNavigation.push(const AddInvoiceSaleReturnPage());
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
                data == []
                    ? Text('No Records')
                    : SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: DataGridPaginated(
                          onEditPressed: (id) async {
                            var inv = await getInvoiceData(id.toString());
                            AppNavigation.push(
                              SellInvoiceDetailsPage(
                                newIndex: id.round(),
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
