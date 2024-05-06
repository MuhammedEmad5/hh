import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';

class GetLastIndexPurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  GetLastIndexPurchaseReturnInvoiceUseCase(
      {required this.purchaseReturnInvoiceRepo});
  Future<String> execute(String tName, String key) async {
    final index = await purchaseReturnInvoiceRepo.getLastIndex(tName, key);
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
