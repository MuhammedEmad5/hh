import 'package:InvoiceF/features/shared/shared_entities/client_vendor_entity/client_vendor_entity_model.dart';

import '../../data/repositories/invoice_a4_repo_impl.dart';

class GetClientVendorDataInvoiceA4UseCase {
  final InvoiceA4Repo invoiceA4Repo;

  GetClientVendorDataInvoiceA4UseCase({required this.invoiceA4Repo});
  Future<ClientVendorEntity> execute(String clientVendorNo) async {
    final res = await invoiceA4Repo.getClientVendorData(clientVendorNo);
    ClientVendorEntity clientVendorData;
    try {
      clientVendorData = ClientVendorEntity.fromJson(res[0]);
    } catch (e) {
      print(e);
      clientVendorData = ClientVendorEntity(clientVendorNo: 0);
    }

    return clientVendorData;
  }
}
