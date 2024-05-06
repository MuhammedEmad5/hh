import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/repositories/purchase_return_invoice_repo.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/queries/purchase_return_invoice_queries.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class PurchaseReturnInvoiceRepo extends BaseRepoClass
    implements IPurchaseReturnInvoiceRepo {
  PurchaseReturnInvoiceRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getBranches() async {
    var res =
        await _connection.readQuery(PurchaseReturnInvoiceQueries.getBranches());
    return res;
  }

  @override
  Future getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    var res = await _connection.readQuery(
        PurchaseReturnInvoiceQueries.getInvoiceData(
            invoiceNo, buildingNo, table));
    return res;
  }

  @override
  Future<dynamic> getLastIndex(String tName, String key) async {
    var res = await _connection
        .readQuery(PurchaseReturnInvoiceQueries.getLastIndex(tName, key));
    return res;
  }
}
