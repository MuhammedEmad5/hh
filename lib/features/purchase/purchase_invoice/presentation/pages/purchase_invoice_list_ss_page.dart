import 'dart:io';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/pages/purchase_invoice_details_page.dart';
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
import '../../domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import '../manager/invoice_buy_cubit.dart';

class BuyInvoiceSSPage extends StatefulWidget {
  const BuyInvoiceSSPage({super.key});

  @override
  State<BuyInvoiceSSPage> createState() => _BuyInvoiceSSPageState();
}

class _BuyInvoiceSSPageState extends State<BuyInvoiceSSPage> {
  int dataCount = 0;
  bool isLoading = true;

  late IConnection connection;
  getDataCount() async {
    dataCount = await context.read<InvoiceBuyCubit>().getDataCount();
    setState(() {
      isLoading = false;
    });
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
        title: AppLocalizations.of(context)!.purchase_invoice,
        onAddPressed: () {
          AppNavigation.push(const AddBuyInvoicePage(
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
                      InvoiceBuyEntity(
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
                    tableName: 'invoicebuy',
                    orderBy: 'invoiceNo',
                    fromJson: (json) {
                      return InvoiceBuyEntity.fromJson(json);
                    },
                    onEditPressed: (id, data) {
                      AppNavigation.push(
                        AddBuyInvoicePage(
                          newIndex: id.round(),
                          isEdit: true,
                          data: data
                              .firstWhere((element) => element.invoiceNo == id),
                        ),
                      );
                    },
                    onDeletePressed: (id) {
                      context.read<InvoiceBuyCubit>().deleteInvoiceBuy(id: id);
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
