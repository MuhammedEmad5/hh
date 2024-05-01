import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class GetLastIndexInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetLastIndexInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<String> execute(String tName, String key) async {
    final index = await invoiceSellRepo.getLastIndex(tName, key);
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
