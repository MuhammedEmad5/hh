import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell/invoice_sell_model.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/data/repositories/invoice_a4_repo_impl.dart';

class GetInvoiceDataInvoiceA4UseCase {
  final InvoiceA4Repo invoiceA4Repo;

  GetInvoiceDataInvoiceA4UseCase({required this.invoiceA4Repo});
  Future<InvoiceSell> execute(
      String invoiceNo, String buildingNo, String table) async {
    var res = await invoiceA4Repo.getInvoiceData(invoiceNo, buildingNo, table);
    InvoiceSell invoiceData;
    try {
      invoiceData = InvoiceSell.fromJson(res[0]);
    } catch (e) {
      print(e);
      invoiceData = InvoiceSell();
    }

    return invoiceData;
  }
}
