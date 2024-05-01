import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';

class GetDataCountInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  GetDataCountInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<int> execute() async {
    final res = await invoiceBuyRepo.getDataCount();
    int dataCount = 0;
    try {
      dataCount = res[0].values.first;
    } catch (e) {
      print(e);
    }
    return dataCount;
  }
}
