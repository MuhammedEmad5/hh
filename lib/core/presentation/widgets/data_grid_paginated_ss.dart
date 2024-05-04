import 'package:InvoiceF_Sales/core/data/datasources/connection.dart';
import 'package:InvoiceF_Sales/core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import 'package:InvoiceF_Sales/core/navigation/navigation.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/toast_notification.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/colors.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  // CUSTOM FILTERING LOGIC
                  // sortIcon: SizedBox(),
                  // filterIcon: Material(
                  //   color: Colors.transparent,
                  //   borderRadius: BorderRadius.circular(50),
                  //   child: InkWell(
                  //       borderRadius: BorderRadius.circular(50),
                  //       onTap: () {
                  //         print('CUSTOM FILTER');
                  //         // this.dataSource.handlePageChange(1, 0);
                  //         pagerController.firstPage();
                  //       },
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(1.0),
                  //         child: Icon(
                  //           Icons.sort,
                  //           color: AppColors.onPrimary,
                  //         ),
                  //       )),
                  // ),
                  // sortIconColor: AppColors.onPrimary,
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
                        : ColumnWidthMode.fitByColumnName,
                    onFilterChanged: (DataGridFilterChangeDetails details) {
                      // print(
                      //     '-----------------------------------------------------');
                      // print('Column Name: ${details.column.columnName}');
                      // print(
                      //     'Filter Type: ${details.filterConditions.last.type}');
                      // print(
                      //     'Filter Value : ${details.filterConditions.last.value}');
                    },
                    onFilterChanging: (DataGridFilterChangeDetails details) {
                      // print(
                      //     '-----------------------------------------------------');
                      // print('Column Name: ${details.column.columnName}');
                      // print(
                      //     'Filter Type: ${details.filterConditions.last.type}');
                      // print(
                      //     'Filter Value : ${details.filterConditions.last.value}');
                      // if (details.column.columnName == 'Arabic Name') {
                      //   return false;
                      // }
                      return true;
                    },
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

class CustomDataGridSource extends DataGridSource {
  CustomDataGridSource(
    this.dataList,
    this.tableName,
    this.orderBy,
    this.rowsPerPage,
    this.fromJson,
    this.onEditPressed,
    this.onDeletePressed,
    this.getIsLoading,
    this.startLoading,
    this.endLoading,
  ) {
    dataGridRows = dataList
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  Function getIsLoading;
  Function startLoading;
  Function endLoading;
  List paginatedData = [];
  List<DataGridRow> dataGridRows = [];
  List<dynamic> dataList = [];
  String tableName;
  String orderBy;
  Function(num, dynamic)? onEditPressed;
  Function(num)? onDeletePressed;
  IConnection connection = GetIt.I<IConnection>();
  int rowsPerPage;
  Function fromJson;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.grey.withAlpha(35);
      }

      return Colors.transparent;
    }

    final int rowIndex = effectiveRows.indexOf(row);
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return row.getCells().indexOf(dataGridCell) == 0 &&
              dataGridCell.value == -1
          ? const SizedBox()
          : dataGridCell.columnName ==
                  AppLocalizations.of(AppNavigation.context)!.edit
              ? Container(
                  color: getRowBackgroundColor(),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        if (onEditPressed != null) {
                          onEditPressed!(
                              row.getCells()[0].value, paginatedData[rowIndex]);
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : dataGridCell.columnName ==
                      AppLocalizations.of(AppNavigation.context)!.delete
                  ? Container(
                      color: getRowBackgroundColor(),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (onDeletePressed != null) {
                              onDeletePressed!(row.getCells()[0].value);
                              dataGridRows.remove(row);
                              notifyListeners();
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.redColor,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: getRowBackgroundColor(),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        dataGridCell.value.toString(),
                      ));
    }).toList());
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  String getQuery(newPageIndex) {
    String localQuery =
        'SELECT * FROM $tableName ORDER BY $orderBy LIMIT $rowsPerPage OFFSET ${rowsPerPage * newPageIndex}';
    String remoteQuery =
        'SELECT * FROM $tableName ORDER BY $orderBy OFFSET ${rowsPerPage * newPageIndex} ROWS FETCH NEXT $rowsPerPage ROWS ONLY;';
    return connection is LocalConnection ? localQuery : remoteQuery;
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    if (!getIsLoading()) {
      startLoading();
      try {
        var response = await connection.readQuery(getQuery(newPageIndex));
        paginatedData = [];
        for (var element in response) {
          paginatedData.add(fromJson(element));
        }
      } catch (e) {
        showToast(context: AppNavigation.context, message: e.toString());
      }

      buildPaginatedDataGridRows();
      notifyListeners();
      endLoading();
      return true;
    } else {
      return false;
    }
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedData
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }
}
