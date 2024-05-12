import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/colors.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';

part 'data_source.dart';

class DataGridPaginated extends StatefulWidget {
  const DataGridPaginated({
    super.key,
    this.gridKey,
    required this.data,
    this.allowFiltering = false,
    this.allowSorting = false,
    this.fill = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.rowsPerPage = 15,
    this.noBorder = false,
    this.hiddenColumns,
    this.allowDraging = false,
  });
  final GlobalKey<SfDataGridState>? gridKey;
  final dynamic data;
  final bool allowFiltering;
  final bool allowSorting;
  final bool fill;
  final Function(dynamic)? onEditPressed;
  final Function(num)? onDeletePressed;
  final int rowsPerPage;
  final bool noBorder;
  final List<String>? hiddenColumns;
  final bool allowDraging;
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
    gridColumns = getColumns(columns, widget.hiddenColumns ?? []);
    dataSource = CustomDataGridSource(
      widget.data,
      gridColumns,
      widget.rowsPerPage,
      widget.onEditPressed,
      widget.onDeletePressed,
    );
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
                  decoration: widget.noBorder
                      ? null
                      : widget.fill
                          ? BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey))
                          : null,
                  child: ClipRect(
                    clipper: CustomLeftClipper(),
                    child: SfDataGrid(
                      allowColumnsDragging: widget.allowDraging,
                      onColumnDragging: (DataGridColumnDragDetails details) {
                        if (details.action ==
                                DataGridColumnDragAction.dropped &&
                            details.to != null) {
                          final GridColumn rearrangeColumn =
                              gridColumns[details.from];
                          gridColumns.removeAt(details.from);
                          gridColumns.insert(details.to!, rearrangeColumn);
                          dataSource.buildDataGridRows();
                          dataSource.refreshDataGrid();
                        }
                        return true;
                      },
                      key: widget.gridKey,
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
  List<GridColumn> getColumns(
      List<String> columnNames, List<String> hiddenColumns) {
    return <GridColumn>[
      ...columnNames.map(
        (e) => GridColumn(
          visible: !hiddenColumns.contains(e),
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

class CustomLeftClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(-2, -2, size.width + 2, size.height + 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
