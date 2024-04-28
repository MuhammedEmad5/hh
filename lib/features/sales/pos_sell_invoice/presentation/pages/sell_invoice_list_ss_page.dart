import 'dart:io';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';
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
import '../../../../../core/presentation/widgets/data_grid_paginated_ss.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../../../core/presentation/widgets/ok_alert.dart';
import '../../domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import '../manager/invoice_sell_cubit.dart';

class SellInvoiceSSPage extends StatefulWidget {
  const SellInvoiceSSPage({super.key});

  @override
  State<SellInvoiceSSPage> createState() => _SellInvoiceSSPageState();
}

class _SellInvoiceSSPageState extends State<SellInvoiceSSPage> {
  int dataCount = 0;
  bool isLoading = true;
  late IConnection connection;

  getDataCount() async {
    var response =
        await connection.readQuery('SELECT Count(invoiceNo) FROM InvoiceSell');
    setState(() {
      dataCount = response[0].values.first;
      isLoading = false;
    });
    print(response[0].values.first);
  }

  @override
  void initState() {
    super.initState();
    connection = context.read<ConnectionTypeBloc>().state.connection ==
            ConnectionEnum.local
        ? LocalConnection()
        : RemoteConnection();
    getDataCount();
  }

  // final _dataGridState = GlobalKey<DataGridPaginatedSSState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.pos_sell_invoice,
        onAddPressed: () {
          AppNavigation.push(const SellInvoiceDetailsPage(
            newIndex: -1,
          ));
        },
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: Loader(),
              )
            : dataCount == 0
                ? CustomEmptyWidget(
                    text: AppLocalizations.of(context)!.no_data,
                  )
                : DataGridPaginatedSS(
                    // key: _dataGridState,
                    data: [
                      InvoiceSellEntity(
                        aName: '',
                        eName: '',
                        invoiceNo: -1,
                        userNumber: '',
                      ),
                    ],
                    fill: Platform.isAndroid || Platform.isIOS ? false : true,
                    allowFiltering: true,
                    dataCount: dataCount,
                    rowsPerPage: 20,
                    tableName: 'invoicesell',
                    orderBy: 'invoiceNo',
                    fromJson: (json) {
                      return InvoiceSellEntity.fromJson(json);
                    },
                    onEditPressed: (id, data) {
                      AppNavigation.push(
                        SellInvoiceDetailsPage(
                          newIndex: id.round(),
                          isEdit: true,
                          data: data
                              .firstWhere((element) => element.invoiceNo == id),
                        ),
                      );
                    },
                    onDeletePressed: (id) {
                      context
                          .read<InvoiceSellCubit>()
                          .deleteInvoiceSell(id: id);
                      showOKDialog(
                        context: context,
                        title: AppLocalizations.of(context)!.success,
                        message: '',
                      );
                    },
                  ),
      ),
    );
  }
}
