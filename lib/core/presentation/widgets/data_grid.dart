import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../constants/colors.dart';
import '../../model/business_model.dart';

late Function(int)? onEditPressed;
late Function(int)? onDeletePressed;

class DataGrid extends StatefulWidget {
  const DataGrid({
    super.key,
    required this.data,
    this.allowFiltering = false,
    this.fill = false,
    this.onEditPressed,
    this.onDeletePressed,
  });
  final List<BusinessModel> data;
  final bool allowFiltering;
  final bool fill;
  final Function(int)? onEditPressed;
  final Function(int)? onDeletePressed;
  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  late List<String> columns;
  late List<GridColumn> gridColumns;
  late CustomDataGridSource dataSource;
  @override
  void initState() {
    super.initState();
    columns = widget.data[0].getColumnNames();
    gridColumns = getColumns(columns);
    dataSource = CustomDataGridSource(widget.data);
    onEditPressed = widget.onEditPressed;
    onDeletePressed = widget.onDeletePressed;
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: const SfDataGridThemeData(
        filterIconColor: AppColors.onPrimary,
        headerColor: AppColors.primaryColor,
        headerHoverColor: AppColors.secondaryColor,
      ),
      child: Container(
        decoration: widget.fill
            ? BoxDecoration(border: Border.all(width: 1, color: Colors.grey))
            : null,
        child: SfDataGrid(
          // shrinkWrapRows: true,
          allowFiltering: widget.allowFiltering,
          source: dataSource,
          columns: gridColumns,
          columnWidthMode: widget.fill
              ? ColumnWidthMode.fill
              : ColumnWidthMode.fitByColumnName,
        ),
      ),
    );
  }

  // Columns
  List<GridColumn> getColumns(List<String> columnNames) {
    return <GridColumn>[
      ...columnNames.map(
        (e) => GridColumn(
          columnName: e,
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

class CustomDataGridSource extends DataGridSource {
  CustomDataGridSource(this.dataList) {
    dataGridRows = dataList
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<DataGridRow> dataGridRows = [];
  List<BusinessModel> dataList = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.grey.withAlpha(35);
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return dataGridCell.columnName == 'Edit'
          ? Container(
              color: getRowBackgroundColor(),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (onEditPressed != null) {
                      onEditPressed!(row.getCells()[0].value);
                    }
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            )
          : dataGridCell.columnName == 'Delete'
              ? Container(
                  color: getRowBackgroundColor(),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        if (onDeletePressed != null) {
                          onDeletePressed!(row.getCells()[0].value);
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
                  ),
                );
    }).toList());
  }

  refreshDataGrid() {
    notifyListeners();
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
