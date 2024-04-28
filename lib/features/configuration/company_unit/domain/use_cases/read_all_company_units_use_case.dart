
import '../../data/repositories/company_unit_repo.dart';
import '../entities/company_unit_entity/company_unit_entity_model.dart';

class ReadAllCompanyUnitsUseCase {
  final CompanyUnitRepo companyUnitRepo;

  ReadAllCompanyUnitsUseCase({required this.companyUnitRepo});

  Future<List<CompanyUnitEntity>> execute() async {
    final List<dynamic> companyUnitJsonArr =
        await companyUnitRepo.getAll<CompanyUnitEntity>();
    final companyUnits = companyUnitJsonArr
        .map((unit) => CompanyUnitEntity.fromJson(unit))
        .toList();

    return companyUnits;
  }
}
