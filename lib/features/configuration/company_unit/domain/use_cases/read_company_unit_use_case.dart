
import '../../data/models/company_unit_model.dart';
import '../../data/repositories/company_unit_repo.dart';

class ReadCompanyUnitUseCase {
  final CompanyUnitRepo companyUnitRepo;

  ReadCompanyUnitUseCase({required this.companyUnitRepo});

  Future<CompanyUnit> execute({required double id}) async {
    final companyUnitJsonArr =
        await companyUnitRepo.getOne<CompanyUnit>(id: id);
    final companyUnitData = companyUnitJsonArr.first;
    final companyUnit = CompanyUnit.fromJson(companyUnitData);

    return companyUnit;
  }
}
