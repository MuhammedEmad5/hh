
import '../../data/mapper/invoice_buy_return_mapper.dart';
import '../../data/models/invoice_buy_return_model.dart';
import '../../data/repositories/purchase_return_invoice_repo.dart';
import '../entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';

class UpdatePurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  UpdatePurchaseReturnInvoiceUseCase({required this.purchaseReturnInvoiceRepo});

  Future<void> execute(InvoiceBuyReturnEntity invoiceBuyReturnEntity,
      {required id}) async {
    final InvoiceBuyReturn invoiceBuyReturn =
        InvoiceBuyReturnMapper().convert(invoiceBuyReturnEntity);
    await purchaseReturnInvoiceRepo.update<InvoiceBuyReturn>(invoiceBuyReturn,
        id: id);
  }
}
