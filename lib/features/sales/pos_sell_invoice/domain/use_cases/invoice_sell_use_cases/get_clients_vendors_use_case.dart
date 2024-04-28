import '../../../data/repositories/invoice_sell_repo_impl.dart';

class GetClientsVendorsUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetClientsVendorsUseCase({required this.invoiceSellRepo});
  Future<List> execute() async {
    final clientsVendors = await invoiceSellRepo.getClientsVendors();
    return clientsVendors;
  }
}
