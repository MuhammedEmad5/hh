import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/core/presentation/widgets/data_grid/data_grid_ss_paginated/queries.dart';

class DataGridAPI {
  Future getGridDataLocal(IConnection connection, String tableName,
      String orderBy, int rowsPerPage, int newPageIndex) async {
    var res = await connection.readQuery(DataGridQueries.localQuery(
        tableName, orderBy, rowsPerPage, newPageIndex));
    return res;
  }

  Future getGridDataRemote(IConnection connection, String tableName,
      String orderBy, int rowsPerPage, int newPageIndex) async {
    var res = await connection.readQuery(DataGridQueries.remoteQuery(
        tableName, orderBy, rowsPerPage, newPageIndex));
    return res;
  }
}
