part of 'data_grid_paginated.dart';

class CustomDataGridSource extends DataGridSource {
  CustomDataGridSource(this.dataList, this.rowsPerPage, this.onEditPressed,
      this.onDeletePressed) {
    dataGridRows = dataList
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<DataGridRow> dataGridRows = [];
  List<dynamic> dataList = [];
  List paginatedData = [];

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
