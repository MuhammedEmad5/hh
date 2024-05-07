import 'package:InvoiceF/features/tax/tax_declaration/data/models/tax_declaration_model.dart';
import 'package:InvoiceF/features/tax/tax_declaration/data/repositories/tax_declaration_repo.dart';

class GetDataTaxDeclarationUseCase {
  final TaxDeclarationRepo taxDeclarationRepo;
  GetDataTaxDeclarationUseCase({required this.taxDeclarationRepo});
  Future<List<TaxDeclaration>> execute(
      String dateTo, String dateFrom, String buildingNo) async {
    final data =
        await taxDeclarationRepo.getDataFiltered(dateTo, dateFrom, buildingNo);
    List<TaxDeclaration> taxData = [];
    try {
      for (var element in data) {
        taxData.add(TaxDeclaration.fromJson(element));
      }
    } catch (e) {
      throw Exception(e);
    }
    return taxData;
  }
}
