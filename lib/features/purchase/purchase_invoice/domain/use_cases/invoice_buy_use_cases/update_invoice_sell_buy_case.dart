import 'package:InvoiceF/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/data/models/invoice_buy_model.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';

class UpdateInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  UpdateInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<void> execute(InvoiceBuyEntity invoiceBuyEntity, {required id}) async {
    final InvoiceBuy invoiceBuy = InvoiceBuyMapper().convert(invoiceBuyEntity);
    await invoiceBuyRepo.update<InvoiceBuy>(invoiceBuy, id: id);
  }
}
