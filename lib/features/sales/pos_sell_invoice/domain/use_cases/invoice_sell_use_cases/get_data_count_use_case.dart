import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class GetDataCountInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetDataCountInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<int> execute() async {
    final res = await invoiceSellRepo.getDataCount();
    int dataCount = 0;
    try {
      dataCount = res[0].values.first;
    } catch (e) {
      print(e);
    }
    return dataCount;
  }
}
