import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class GetClientsVendorsInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetClientsVendorsInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<List> execute() async {
    final clientsVendors = await invoiceSellRepo.getClientsVendors();
    List<String> clientVendorNamesList = [];
    List<int> clientVendorNumbers = [];
    try {
      if (clientsVendors.isNotEmpty) {
        for (var element in clientsVendors) {
          if (!clientVendorNamesList
              .contains('${element['aName']} - ${element['eName']}')) {
            clientVendorNamesList
                .add('${element['aName']} - ${element['eName']}');
            clientVendorNumbers.add(element['clientVendorNo'].round());
          }
        }
      }
    } catch (e) {
      print(e);
    }
    if (clientVendorNumbers.isEmpty) {
      clientVendorNamesList = ['None'];
      clientVendorNumbers = [0];
    }
    return [clientVendorNamesList, clientVendorNumbers];
  }
}
