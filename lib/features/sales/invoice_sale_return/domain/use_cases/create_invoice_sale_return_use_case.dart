import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';

class CreateInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  CreateInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<void> execute(InvoiceSellReturn invoiceSellReturnEntity) async {
    await invoiceSaleReturnRepo.insert(invoiceSellReturnEntity);
  }
}
