import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';

class GetLastIndexInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  GetLastIndexInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<String> execute(String tName, String key) async {
    final index = await invoiceBuyRepo.getLastIndex(tName, key);
    String invoiceNo;
    try {
      invoiceNo = (index[0].values.first + 1).toString();
    } catch (e) {
      print(e);
      invoiceNo = '1';
    }
    return invoiceNo;
  }
}
