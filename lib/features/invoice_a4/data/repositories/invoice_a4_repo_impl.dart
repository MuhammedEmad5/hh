import 'package:InvoiceF_ClientVendor/core/data/datasources/connection.dart';
import 'package:InvoiceF_ClientVendor/core/data/repos/base_repo_class.dart';

import '../../domain/repositories/invoice_a4_repo.dart';
import '../../queries/invoice_a4_queries.dart';

class InvoiceA4Repo extends BaseRepoClass implements IInvoiceA4Repo {
  InvoiceA4Repo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getBranches() async {
    var res = await _connection.readQuery(InvoiceA4Queries.getBranches());
    return res;
  }

  @override
  Future getClientVendorData(String clientVendorNo) async {
    var res = await _connection
        .readQuery(InvoiceA4Queries.getClientVendorData(clientVendorNo));
    return res;
  }

  @override
  Future getCompanyData() async {
    var res = await _connection.readQuery(InvoiceA4Queries.getCompanyData());
    return res;
  }

  @override
  Future getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    var res = await _connection.readQuery(
        InvoiceA4Queries.getInvoiceData(invoiceNo, buildingNo, table));
    return res;
  }

  @override
  Future getInvoiceItems(
      String invoiceNo, String buildingNo, String table) async {
    var res = await _connection.readQuery(
        InvoiceA4Queries.getInvoiceItems(invoiceNo, buildingNo, table));
    print(InvoiceA4Queries.getInvoiceItems(invoiceNo, buildingNo, table));
    return res;
  }
}
