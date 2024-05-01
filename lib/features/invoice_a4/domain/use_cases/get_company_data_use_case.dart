import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/client_vendor_entity/client_vendor_entity_model.dart';

import '../../data/repositories/invoice_a4_repo_impl.dart';

class GetCompanyDataInvoiceA4UseCase {
  final InvoiceA4Repo invoiceA4Repo;

  GetCompanyDataInvoiceA4UseCase({required this.invoiceA4Repo});
  Future<ClientVendorEntity> execute() async {
    final res = await invoiceA4Repo.getCompanyData();
    ClientVendorEntity companyData;
    try {
      res[0]['clientVendorNo'] = 0;
      res[0]['VATID'] = res[0]['businessRegistrationNo'];
      companyData = ClientVendorEntity.fromJson(res[0]);
    } catch (e) {
      print(e);
      companyData = ClientVendorEntity(clientVendorNo: 0);
    }

    return companyData;
  }
}
