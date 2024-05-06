import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/mapper/invoice_buy_return_mapper.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';

class ReadAllPurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  ReadAllPurchaseReturnInvoiceUseCase(
      {required this.purchaseReturnInvoiceRepo});

  Future<List<InvoiceBuyReturnEntity>> execute() async {
    final List<dynamic> invoiceBuyReturnJsonArr =
        await purchaseReturnInvoiceRepo.getAll<InvoiceBuyReturn>();
    final invoiceBuyReturnObjects = invoiceBuyReturnJsonArr
        .map((invoiceBuyReturn) => InvoiceBuyReturn.fromJson(invoiceBuyReturn))
        .toList();
    List<InvoiceBuyReturnEntity> invoiceBuyReturnEntity = [];
    for (InvoiceBuyReturn invoiceBuyReturn in invoiceBuyReturnObjects) {
      invoiceBuyReturnEntity
          .add(InvoiceBuyReturnMapper().convert(invoiceBuyReturn));
    }
    return invoiceBuyReturnEntity;
  }
}
