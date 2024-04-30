
import '../../../data/repositories/invoice_buy_repo_impl.dart';

class GetBranchesInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  GetBranchesInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<List> execute() async {
    final branches = await invoiceBuyRepo.getBranches();
    List<String> branchNames = [];
    List<int> buildingNumbers = [];
    try {
      if (branches.isNotEmpty) {
        for (var element in branches) {
          if (!branchNames
              .contains('${element['aName']} - ${element['eName']}')) {
            branchNames.add('${element['aName']} - ${element['eName']}');
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
