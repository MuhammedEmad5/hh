import 'package:InvoiceF_ClientVendor/core/blocs/connection_type_bloc/connection_bloc.dart';
import 'package:InvoiceF_ClientVendor/core/data/datasources/connection.dart';
import 'package:InvoiceF_ClientVendor/core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import 'package:InvoiceF_ClientVendor/core/data/datasources/remote_data_source/remote_connection.dart';
import 'package:InvoiceF_ClientVendor/core/navigation/navigation.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/toast_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/colors.dart';
import '../../enums/connection_enum.dart';

late int _rowsPerPage;
bool _isLoading = false;
late Function(num, dynamic)? onEditPressed;
late Function(num)? onDeletePressed;
late String orderBy;
late String tableName;
late Function fromJson;
late IConnection connection;

class DataGridPaginatedSS extends StatefulWidget {
  const DataGridPaginatedSS({
    super.key,
    required this.data,
    this.allowFiltering = false,
    this.allowSorting = false,
    this.fill = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.dataCount,
    this.tableName,
    this.orderBy,
    this.rowsPerPage = 15,
    this.fromJson,
  });
  final dynamic data;
  final int? dataCount;
  final bool allowFiltering;
  final bool allowSorting;
  final bool fill;
  final Function(num, dynamic)? onEditPressed;
  final Function(num)? onDeletePressed;
  final String? tableName;
  final String? orderBy;
  final int rowsPerPage;
  final Function? fromJson;
  @override
  State<DataGridPaginatedSS> createState() => _DataGridPaginatedSSState();
}

class _DataGridPaginatedSSState extends State<DataGridPaginatedSS> {
  late List<String> columns;
  late List<GridColumn> gridColumns;
  late CustomDataGridSource dataSource;
  late List data;
  late int dataCount;
  @override
  void initState() {
    super.initState();
    connection = context.read<ConnectionTypeBloc>().state.connection ==
            ConnectionEnum.local
        ? LocalConnection()
        : RemoteConnection();
    data = widget.data;
    columns = data[0].getColumnNames();
    gridColumns = getColumns(columns);
    dataSource = CustomDataGridSource(data);
    onEditPressed = widget.onEditPressed;
    onDeletePressed = widget.onDeletePressed;
    if (widget.dataCount == null) {
      dataCount = data.length;
    } else {
      dataCount = widget.dataCount!;
    }
    orderBy = widget.orderBy ?? '';
    tableName = widget.tableName ?? '';
    _rowsPerPage = widget.rowsPerPage;
    fromJson = widget.fromJson ?? () {};
  }

  DataPagerController pagerController = DataPagerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 520,
          child: Stack(
            children: [
              _isLoading
                  ? Container(
                      color: Colors.black12,
                      child: Center(
                        child: Loader(),
                      ),
                    )
                  : const SizedBox(),
              SfDataGridTheme(
                data: const SfDataGridThemeData(
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
                      print(
                          '-----------------------------------------------------');
                      print('Column Name: ${details.column.columnName}');
                      print(
                          'Filter Type: ${details.filterConditions.last.type}');
                      print(
                          'Filter Value : ${details.filterConditions.last.value}');
                    },
                    onFilterChanging: (DataGridFilterChangeDetails details) {
                      print(
                          '-----------------------------------------------------');
                      print('Column Name: ${details.column.columnName}');
                      print(
                          'Filter Type: ${details.filterConditions.last.type}');
                      print(
                          'Filter Value : ${details.filterConditions.last.value}');
                      if (details.column.columnName == 'Arabic Name') {
                        return false;
                      }
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
            pageCount: dataCount / _rowsPerPage < 1
                ? 1
                : dataCount % _rowsPerPage > 0
                    ? dataCount / _rowsPerPage + 1
                    : dataCount / _rowsPerPage,
            delegate: dataSource,
            onPageNavigationStart: (int pageIndex) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageNavigationEnd: (int pageIndex) async {
              setState(() {
                _isLoading = false;
              });
            },
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

List paginatedData = [];

class CustomDataGridSource extends DataGridSource {
  CustomDataGridSource(this.dataList) {
    dataGridRows = dataList
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<DataGridRow> dataGridRows = [];
  List<dynamic> dataList = [];

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
          ? SizedBox()
          : dataGridCell.columnName ==
                  AppLocalizations.of(AppNavigation.context)!.edit
              ? Container(
                  color: getRowBackgroundColor(),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        if (onEditPressed != null) {
                          // final Map<String, dynamic> data = {};
                          // for (int i = 0; i < row.getCells().length; i++) {
                          //   data[row.getCells()[i].columnName] =
                          //       row.getCells()[i].value;
                          // }
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

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    print(oldPageIndex);
    print(newPageIndex);

    try {
      var response = await connection.readQuery(connection is LocalConnection
          ? 'SELECT * FROM $tableName ORDER BY $orderBy LIMIT $_rowsPerPage OFFSET ${_rowsPerPage * newPageIndex}'
          : 'SELECT * FROM $tableName ORDER BY $orderBy OFFSET ${_rowsPerPage * newPageIndex} ROWS FETCH NEXT $_rowsPerPage ROWS ONLY;');
      List data = [];
      for (var element in response) {
        data.add(fromJson(element));
      }
      paginatedData = data;
    } catch (e) {
      showToast(context: AppNavigation.context, message: e.toString());
      print(e);
    }

    buildPaginatedDataGridRows();
    notifyListeners();

    // int startIndex = newPageIndex * _rowsPerPage;
    // // int endIndex = startIndex + _rowsPerPage;
    // // // if (startIndex < dataList.length && endIndex <= dataList.length) {
    // // //   paginatedData =
    // // //       dataList.getRange(startIndex, endIndex).toList(growable: false);
    // // //   buildPaginatedDataGridRows();
    // // //   notifyListeners();
    // // // } else {
    // // //   paginatedData = dataList
    // // //       .getRange(startIndex, dataList.length)
    // // //       .toList(growable: false);
    // // //   buildPaginatedDataGridRows();
    // // //   notifyListeners();
    // // // }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedData
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }
}
