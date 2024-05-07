import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:InvoiceF/core/presentation/widgets/data_grid/data_grid_ss_paginated/api_call.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/toast_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/colors.dart';

part "data_source.dart";

class DataGridPaginatedSS extends StatefulWidget {
  final dynamic data;
  final String tableName;
  final String orderBy;
  final Function fromJson;
  final int? dataCount;
  final int rowsPerPage;
  final bool allowFiltering;
  final bool allowSorting;
  final bool fill;
  final Function(num, dynamic)? onEditPressed;
  final Function(num)? onDeletePressed;
  const DataGridPaginatedSS({
    super.key,
    required this.data,
    required this.tableName,
    required this.orderBy,
    required this.fromJson,
    this.dataCount,
    this.allowFiltering = false,
    this.allowSorting = false,
    this.fill = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.rowsPerPage = 15,
  });
  @override
  State<DataGridPaginatedSS> createState() => _DataGridPaginatedSSState();
}

class _DataGridPaginatedSSState extends State<DataGridPaginatedSS> {
  late List<String> columns;
  late List<GridColumn> gridColumns;
  late CustomDataGridSource dataSource;
  late int dataCount;
  bool isLoading = false;

  DataPagerController pagerController = DataPagerController();

  startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  endLoading() {
    setState(() {
      isLoading = false;
    });
  }

  bool getIsLoading() {
    return isLoading;
  }

  @override
  void initState() {
    super.initState();
    columns = widget.data[0].getColumnNames();
    gridColumns = getColumns(columns);
    dataSource = CustomDataGridSource(
      widget.data,
      widget.tableName,
      widget.orderBy,
      widget.rowsPerPage,
      widget.fromJson,
      widget.onEditPressed,
      widget.onDeletePressed,
      getIsLoading,
      startLoading,
      endLoading,
    );
    if (widget.dataCount == null) {
      dataCount = widget.data.length;
    } else {
      dataCount = widget.dataCount!;
    }
  }

  final screenData = BootstrapTheme.of(AppNavigation.context);

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = screenData.currentBreakPoint
        .isBreakPointOrSmaller(screenData.breakPoints.xs);
    return Column(
      children: [
        SizedBox(
          height: 520,
          child: Stack(
            children: [
              isLoading
                  ? Container(
                      color: Colors.black12,
                      child: Center(
                        child: Loader(),
                      ),
                    )
                  : const SizedBox(),
              SfDataGridTheme(
                data: const SfDataGridThemeData(
                  sortIconColor: AppColors.onPrimary,
                  filterIconColor: AppColors.onPrimary,
                  headerColor: AppColors.primaryColor,
                  headerHoverColor: AppColors.secondaryColor,
                ),
                child: Container(
                  decoration: widget.fill
                      ? BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey))
                      : null,
                  child: SfDataGrid(
                    shrinkWrapRows: true,
                    onQueryRowHeight: (details) {
                      return details.getIntrinsicRowHeight(details.rowIndex);
                    },
                    allowSorting: widget.allowSorting,
                    allowFiltering: widget.allowFiltering,
                    source: dataSource,
                    columns: gridColumns,
                    columnWidthMode: widget.fill
                        ? ColumnWidthMode.fill
                        : isSmallScreen
                            ? ColumnWidthMode.fitByColumnName
                            : ColumnWidthMode.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        SfDataPagerTheme(
          data: const SfDataPagerThemeData(
            selectedItemColor: AppColors.primaryColor,
          ),
          child: SfDataPager(
            controller: pagerController,
            itemHeight: 51,
            itemWidth: 51,
            visibleItemsCount: 3,
            pageCount: dataCount / widget.rowsPerPage < 1
                ? 1
                : dataCount % widget.rowsPerPage > 0
                    ? dataCount / widget.rowsPerPage + 1
                    : dataCount / widget.rowsPerPage,
            delegate: dataSource,
          ),
        ),
      ],
    );
  }

  // Columns
  List<GridColumn> getColumns(List<String> columnNames) {
    return <GridColumn>[
      ...columnNames.map(
        (e) => GridColumn(
          filterPopupMenuOptions: const FilterPopupMenuOptions(
              filterMode: FilterMode.advancedFilter,
              canShowSortingOptions: false),
          allowEditing:
              e == AppLocalizations.of(AppNavigation.context)!.delete ||
                      e == AppLocalizations.of(AppNavigation.context)!.edit
                  ? false
                  : true,
          allowFiltering:
              e == AppLocalizations.of(AppNavigation.context)!.delete ||
                      e == AppLocalizations.of(AppNavigation.context)!.edit
                  ? false
                  : true,
          allowSorting:
              e == AppLocalizations.of(AppNavigation.context)!.delete ||
                      e == AppLocalizations.of(AppNavigation.context)!.edit
                  ? false
                  : true,
          columnName: e,
          maximumWidth:
              e == AppLocalizations.of(AppNavigation.context)!.delete ||
                      e == AppLocalizations.of(AppNavigation.context)!.edit
                  ? 60
                  : double.nan,
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              e,
              overflow: TextOverflow.clip,
              softWrap: true,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      )
    ];
  }
}
