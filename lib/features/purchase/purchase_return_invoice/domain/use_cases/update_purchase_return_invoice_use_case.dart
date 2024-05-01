import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/mapper/invoice_buy_return_mapper.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';

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
