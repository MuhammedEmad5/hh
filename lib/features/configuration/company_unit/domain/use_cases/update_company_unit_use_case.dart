import '../../data/mapper/company_unit_mapper.dart';
import '../../data/models/company_unit_model.dart';
import '../../data/repositories/company_unit_repo.dart';
import '../entities/company_unit_entity/company_unit_entity_model.dart';

class UpdateCompanyUnitUseCase {
  final CompanyUnitRepo companyUnitRepo;

  UpdateCompanyUnitUseCase({required this.companyUnitRepo});

  Future<void> execute(CompanyUnitEntity companyUnit, {required id}) async {
    CompanyUnit unit = CompanyUnitMapper().convert(companyUnit);
    await companyUnitRepo.update<CompanyUnit>(unit, id: id, skipNo: 2);
  }
}
