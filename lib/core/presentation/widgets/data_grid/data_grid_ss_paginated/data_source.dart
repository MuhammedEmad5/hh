part of "data_grid_paginated_ss.dart";

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
  int rowsPerPage;
  Function fromJson;
  IConnection connection = GetIt.I<IConnection>();

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
          : dataGridCell.value == null &&
                  dataGridCell.columnName !=
                      AppLocalizations.of(AppNavigation.context)!.edit &&
                  dataGridCell.columnName !=
                      AppLocalizations.of(AppNavigation.context)!.delete
              ? Container(
                  color: getRowBackgroundColor(),
                )
              : dataGridCell.columnName ==
                      AppLocalizations.of(AppNavigation.context)!.edit
                  ? Container(
                      color: getRowBackgroundColor(),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (onEditPressed != null) {
                              onEditPressed!(row.getCells()[0].value,
                                  paginatedData[rowIndex]);
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
    if (!getIsLoading()) {
      startLoading();
      try {
        dynamic response;
        if (connection is LocalConnection) {
          response = await DataGridAPI().getGridDataLocal(
              connection, tableName, orderBy, rowsPerPage, newPageIndex);
        } else {
          response = await DataGridAPI().getGridDataRemote(
              connection, tableName, orderBy, rowsPerPage, newPageIndex);
        }
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
