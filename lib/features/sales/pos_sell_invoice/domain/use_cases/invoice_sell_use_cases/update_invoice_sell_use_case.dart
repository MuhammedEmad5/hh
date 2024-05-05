import 'package:InvoiceF/features/sales/pos_sell_invoice/data/mapper/invoice_sell_mapper.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';

class UpdateInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  UpdateInvoiceSellUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellEntity invoiceSellEntity,
      {required id}) async {
    final InvoiceSell invoiceSell =
        InvoiceSellMapper().convert(invoiceSellEntity);
    await invoiceSellRepo.update<InvoiceSell>(invoiceSell, id: id);
  }
}
