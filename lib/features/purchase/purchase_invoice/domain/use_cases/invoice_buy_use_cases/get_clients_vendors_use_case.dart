import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';

class GetClientsVendorsInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  GetClientsVendorsInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<List> execute() async {
    final clientsVendors = await invoiceBuyRepo.getClientsVendors();
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
