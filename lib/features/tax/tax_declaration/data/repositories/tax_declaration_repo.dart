import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/features/tax/tax_declaration/domain/repositories/tax_declaration_repo.dart';
import 'package:InvoiceF/features/tax/tax_declaration/queries/tax_declaration_queries.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class TaxDeclarationRepo extends BaseRepoClass implements ITaxDeclarationRepo {
  TaxDeclarationRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getBranches() async {
    var res = await _connection.readQuery(TaxDeclarationQueries.getBranches());
    return res;
  }

  @override
  Future<dynamic> getDataFiltered(
      String dateTo, String dateFrom, String buildingNo) async {
    var res = await _connection.readQuery(
        TaxDeclarationQueries.getDataFiltered(dateTo, dateFrom, buildingNo));
    return res;
  }
}
