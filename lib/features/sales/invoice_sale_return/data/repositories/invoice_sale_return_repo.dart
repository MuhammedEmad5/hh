import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/domain/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/queries/invoice_sale_return_queries.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class InvoiceSaleReturnRepo extends BaseRepoClass
    implements IInvoiceSaleReturnRepo {
  InvoiceSaleReturnRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getBranches() async {
    var res =
        await _connection.readQuery(InvoiceSaleReturnQueries.getBranches());
    return res;
  }

  @override
  Future getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    var res = await _connection.readQuery(
        InvoiceSaleReturnQueries.getInvoiceData(invoiceNo, buildingNo, table));
    return res;
  }

  @override
  Future<dynamic> getLastIndex(String tName, String key) async {
    var res = await _connection
        .readQuery(InvoiceSaleReturnQueries.getLastIndex(tName, key));
    return res;
  }
}
