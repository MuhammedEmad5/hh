import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class InsertInvoiceSaleReturnUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  InsertInvoiceSaleReturnUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellReturn invoiceSellReturnEntity) async {
    await invoiceSellRepo.insert(invoiceSellReturnEntity);
  }
}
