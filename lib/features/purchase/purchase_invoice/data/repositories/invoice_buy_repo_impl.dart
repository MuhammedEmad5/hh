import 'package:InvoiceF_ClientVendor/core/data/datasources/connection.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/repositories/invoice_buy_repo.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/queries/purchase_invoice_queries.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class InvoiceBuyRepo extends BaseRepoClass implements IInvoiceBuyRepo {
  InvoiceBuyRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getDataCount() async {
    var res =
        await _connection.readQuery(PurchaseInvoiceQueries.getDataCount());
    return res;
  }

  @override
  Future<dynamic> getBranches() async {
    var res = await _connection.readQuery(PurchaseInvoiceQueries.getBranches());
    return res;
  }

  @override
  Future<dynamic> getClientsVendors() async {
    var res =
        await _connection.readQuery(PurchaseInvoiceQueries.getClientsVendors());
    return res;
  }

  @override
  Future<dynamic> getItems(String invoiceNo) async {
    var res =
        await _connection.readQuery(PurchaseInvoiceQueries.getItems(invoiceNo));

    return res;
  }

  @override
  Future<dynamic> getLastIndex(String tName, String key) async {
    var res = await _connection
        .readQuery(PurchaseInvoiceQueries.getLastIndex(tName, key));
    return res;
  }

  @override
  Future<dynamic> searchItem(String barCode, String invoiceNo) async {
    var res = await _connection
        .readQuery(PurchaseInvoiceQueries.searchItems(barCode));
    return res;
  }
}
