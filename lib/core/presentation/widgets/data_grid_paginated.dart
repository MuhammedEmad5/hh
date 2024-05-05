import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/colors.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';

class DataGridPaginated extends StatefulWidget {
  const DataGridPaginated({
    super.key,
    required this.data,
    this.allowFiltering = false,
    this.allowSorting = false,
    this.fill = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.rowsPerPage = 15,
  });
  final dynamic data;
  final bool allowFiltering;
  final bool allowSorting;
  final bool fill;
  final Function(dynamic)? onEditPressed;
  final Function(num)? onDeletePressed;
  final int rowsPerPage;
  @override
  State<DataGridPaginated> createState() => _DataGridPaginatedState();
}

class _DataGridPaginatedState extends State<DataGridPaginated> {
  late List<String> columns;
  late List<GridColumn> gridColumns;
  late CustomDataGridSource dataSource;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    columns = widget.data[0].getColumnNames();
    gridColumns = getColumns(columns);
    dataSource = CustomDataGridSource(
      widget.data,
      widget.rowsPerPage,
      widget.onEditPressed,
      widget.onDeletePressed,
    );
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
                      child: const Center(
                        child: CircularProgressIndicator(),
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
                        : ColumnWidthMode.fitByColumnName,
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
            pageCount: widget.data.length / widget.rowsPerPage < 1
                ? 1
                : widget.data.length % widget.rowsPerPage > 0
                    ? widget.data.length / widget.rowsPerPage + 1
                    : widget.data.length / widget.rowsPerPage,
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
          // width: 100,
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
  CustomDataGridSource(this.dataList, this.rowsPerPage, this.onEditPressed,
      this.onDeletePressed) {
    dataGridRows = dataList
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<DataGridRow> dataGridRows = [];
  List<dynamic> dataList = [];

  int rowsPerPage = 10;
  Function(dynamic)? onEditPressed;
  Function(num)? onDeletePressed;

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
      return dataGridCell.columnName ==
              AppLocalizations.of(AppNavigation.context)!.edit
          ? Container(
              color: getRowBackgroundColor(),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (onEditPressed != null) {
                      onEditPressed!(paginatedData[rowIndex]);
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
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if (startIndex < dataList.length && endIndex <= dataList.length) {
      paginatedData =
          dataList.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      paginatedData = dataList
          .getRange(startIndex, dataList.length)
          .toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = paginatedData
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }
}

class CustomLeftClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(2, 2, size.width - 2, size.height - 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
