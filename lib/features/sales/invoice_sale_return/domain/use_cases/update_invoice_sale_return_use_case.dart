import 'package:InvoiceF/features/sales/invoice_sale_return/data/mapper/invoice_sell_return_mapper.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/domain/entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';

class UpdateInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  UpdateInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<void> execute(InvoiceSellReturnEntity invoiceSellReturnEntity,
      {required id}) async {
    final InvoiceSellReturn invoiceSellReturn =
        InvoiceSellReturnMapper().convert(invoiceSellReturnEntity);
    await invoiceSaleReturnRepo.update<InvoiceSellReturn>(invoiceSellReturn,
        id: id);
  }
}
