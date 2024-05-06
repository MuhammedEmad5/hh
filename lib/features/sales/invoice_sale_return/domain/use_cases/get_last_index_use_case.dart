import 'package:InvoiceF/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';

class GetLastIndexInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  GetLastIndexInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});
  Future<String> execute(String tName, String key) async {
    final index = await invoiceSaleReturnRepo.getLastIndex(tName, key);
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
