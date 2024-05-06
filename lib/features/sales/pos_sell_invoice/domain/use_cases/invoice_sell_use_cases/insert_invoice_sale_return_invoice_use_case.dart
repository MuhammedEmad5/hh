import 'package:InvoiceF/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class InsertInvoiceSaleReturnUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  InsertInvoiceSaleReturnUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellReturn invoiceSellReturn) async {
    await invoiceSellRepo.insert(invoiceSellReturn);
  }
}
