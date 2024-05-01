import 'dart:io';

import 'package:InvoiceF_Sales/core/navigation/navigation.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/data_grid_paginated_ss.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/manager/invoice_sell_cubit.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/presentation/pages/sell_invoice_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SellInvoiceSSPage extends StatefulWidget {
  const SellInvoiceSSPage({super.key});

  @override
  State<SellInvoiceSSPage> createState() => _SellInvoiceSSPageState();
}

class _SellInvoiceSSPageState extends State<SellInvoiceSSPage> {
  int dataCount = 0;
  bool isLoading = true;

  getDataCount() async {
    dataCount = await context.read<InvoiceSellCubit>().getDataCount();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
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
                            newIndex: id.round(), isEdit: true, data: data),
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
