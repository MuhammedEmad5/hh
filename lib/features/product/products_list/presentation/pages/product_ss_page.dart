import 'dart:io';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/data_grid_paginated_ss.dart';
import 'package:InvoiceF/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/ok_alert.dart';
import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/product/products_list/domain/entities/item_entity_model.dart';
import 'package:InvoiceF/features/product/products_list/presentation/manager/product_cubit.dart';
import 'package:InvoiceF/features/product/products_list/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductSSPage extends StatefulWidget {
  const ProductSSPage({super.key});

  @override
  State<ProductSSPage> createState() => _ProductSSPageState();
}

class _ProductSSPageState extends State<ProductSSPage> {
  int dataCount = 0;
  bool isLoading = true;

  getDataCount() async {
    dataCount = await context.read<ProductCubit>().getDataCount();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataCount();
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<ProductCubit>().isClosed) {
      LoggerSingleton.logger.i('The Bloc is closed.');
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.productList,
        onAddPressed: () {
          AppNavigation.push(const ProductDetailsPage(
            newIndex: -1,
          ));
        },
      ),
      body: SafeArea(
        child: dataCount == 0 && isLoading == true
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
                      ItemEntity(
                        itemNo: -1,
                        barCode: '0',
                        userNumber: '0',
                        aName: '',
                        eName: '',
                      ),
                    ],
                    fill: Platform.isAndroid || Platform.isIOS ? false : true,
                    allowFiltering: true,
                    dataCount: dataCount,
                    rowsPerPage: 20,
                    tableName: 'item',
                    orderBy: 'itemNo',
                    fromJson: (json) {
                      return ItemEntity.fromJson(json);
                    },
                    onEditPressed: (id, data) {
                      AppNavigation.push(
                        ProductDetailsPage(
                            isEdit: true, newIndex: id.round(), data: data),
                      );
                    },
                    onDeletePressed: (id) {
                      context.read<ProductCubit>().deleteProduct(id: id);
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
