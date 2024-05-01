import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/models/invoice_buy_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';

import '../../../data/mapper/invoice_buy_mapper.dart';

class CreateInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  CreateInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<void> execute(InvoiceBuyEntity invoiceBuyEntity) async {
    final InvoiceBuy invoiceBuy = InvoiceBuyMapper().convert(invoiceBuyEntity);
    await invoiceBuyRepo.insert(invoiceBuy);
  }
}
