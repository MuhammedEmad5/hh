import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';

class RemoveInvoiceSellUnitUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  RemoveInvoiceSellUnitUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellUnitEntity invoiceSellUnitEntity) async {
    await invoiceSellRepo.removeItem(
        invoiceSellUnitEntity.invoiceNo.toString(),
        invoiceSellUnitEntity.buildingNo.toString(),
        invoiceSellUnitEntity.orderNo.toString());
  }
}
