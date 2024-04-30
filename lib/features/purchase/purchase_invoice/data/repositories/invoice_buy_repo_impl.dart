import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../domain/repositories/invoice_buy_repo.dart';
import '../../queries/purchase_invoice_queries.dart';

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
