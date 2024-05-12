import '../../data/mapper/company_mapper.dart';
import '../../data/models/company_model.dart';
import '../../data/repositories/company_repo_impl.dart';
import '../entities/company_general_entity/company_entity.dart';

class CreateCompanyUseCase {
  final CompanyRepo companyRepo;

  CreateCompanyUseCase(this.companyRepo);

  Future<void> execute(CompanyEntity companyEntity) async {
    final Company company = CompanyMapper().convert(companyEntity);
    await companyRepo.insert(company);
  }
}
