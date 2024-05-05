import 'package:InvoiceF/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';

import '../../../data/mapper/invoice_sell_mapper.dart';

class CreateInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  CreateInvoiceSellUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellEntity invoiceSellEntity) async {
    final InvoiceSell invoiceSell =
        InvoiceSellMapper().convert(invoiceSellEntity);
    await invoiceSellRepo.insert(invoiceSell);
  }
}
