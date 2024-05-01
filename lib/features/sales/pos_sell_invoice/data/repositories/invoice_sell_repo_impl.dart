import 'package:InvoiceF_Sales/core/data/datasources/connection.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/repositories/invoice_sell_repo.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/queries/sell_invoice_queries.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class InvoiceSellRepo extends BaseRepoClass implements IInvoiceSellRepo {
  InvoiceSellRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getDataCount() async {
    var res = await _connection.readQuery(SellInvoiceQueries.getDataCount());
    return res;
  }

  @override
  Future<dynamic> getBranches() async {
    var res = await _connection.readQuery(SellInvoiceQueries.getBranches());
    return res;
  }

  @override
  Future<dynamic> getClientsVendors() async {
    var res =
        await _connection.readQuery(SellInvoiceQueries.getClientsVendors());
    return res;
  }

  @override
  Future<dynamic> getItems(String invoiceNo) async {
    var res =
        await _connection.readQuery(SellInvoiceQueries.getItems(invoiceNo));

    return res;
  }

  @override
  Future<dynamic> getLastIndex(String tName, String key) async {
    var res = await _connection
        .readQuery(SellInvoiceQueries.getLastIndex(tName, key));
    return res;
  }

  @override
  Future<dynamic> searchItem(String barCode, String invoiceNo) async {
    var res =
        await _connection.readQuery(SellInvoiceQueries.searchItems(barCode));
    return res;
  }
}
