import 'package:InvoiceF/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';

class GetBranchesInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  GetBranchesInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});
  Future<List> execute() async {
    final branches = await invoiceSaleReturnRepo.getBranches();
    List<String> branchNames = [];
    List<int> buildingNumbers = [];
    try {
      if (branches.isNotEmpty) {
        for (var element in branches) {
          if (!branchNames
              .contains('${element['aName']} - ${element['eName']}')) {
            branchNames.add('${element['aName']} - ${element['eName']}');
            buildingNumbers.add(element['buildingNo'].round());
          } else {
            int repeatedNo = 0;
            for (var e in branches) {
              if ('${e['aName']} - ${e['eName']}' ==
                  '${element['aName']} - ${element['eName']}') {
                repeatedNo++;
              }
            }
            branchNames
                .add('${element['aName']} - ${element['eName']} ($repeatedNo)');
            buildingNumbers.add(element['buildingNo'].round());
          }
        }
      }
    } catch (e) {
      print(e);
    }
    if (buildingNumbers.isEmpty) {
      branchNames = ['Main Branch - الفرع الرئيسى'];
      buildingNumbers = [0];
    }
    return [branchNames, buildingNumbers];
  }
}
