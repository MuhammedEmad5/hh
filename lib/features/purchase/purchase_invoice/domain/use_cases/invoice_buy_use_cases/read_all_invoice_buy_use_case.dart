import 'package:InvoiceF/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/data/models/invoice_buy_model.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';

class ReadAllInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  ReadAllInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<List<InvoiceBuyEntity>> execute() async {
    final List<dynamic> invoiceBuyJsonArr =
        await invoiceBuyRepo.getAll<InvoiceBuy>();
    final invoiceBuyObjects = invoiceBuyJsonArr
        .map((invoiceBuy) => InvoiceBuy.fromJson(invoiceBuy))
        .toList();
    List<InvoiceBuyEntity> invoiceBuyEntity = [];
    for (InvoiceBuy invoiceBuy in invoiceBuyObjects) {
      invoiceBuyEntity.add(InvoiceBuyMapper().convert(invoiceBuy));
    }

    return invoiceBuyEntity;
  }
}
