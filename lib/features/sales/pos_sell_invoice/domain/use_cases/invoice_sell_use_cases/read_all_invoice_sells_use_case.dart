import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/mapper/invoice_sell_mapper.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';

class ReadAllInvoiceSalesUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  ReadAllInvoiceSalesUseCase({required this.invoiceSellRepo});

  Future<List<InvoiceSellEntity>> execute() async {
    final List<dynamic> invoiceSellJsonArr =
        await invoiceSellRepo.getAll<InvoiceSell>();
    final invoiceSellObjects = invoiceSellJsonArr
        .map((invoiceSell) => InvoiceSell.fromJson(invoiceSell))
        .toList();
    List<InvoiceSellEntity> invoiceSellEntity = [];
    for (InvoiceSell invoiceSell in invoiceSellObjects) {
      invoiceSellEntity.add(InvoiceSellMapper().convert(invoiceSell));
    }

    return invoiceSellEntity;
  }
}
