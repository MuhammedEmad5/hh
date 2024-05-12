import '../../data/mapper/company_mapper.dart';
import '../../data/models/company_model.dart';
import '../../data/repositories/company_repo_impl.dart';
import '../entities/company_general_entity/company_entity.dart';

class UpdateCompanyUseCase {
  final CompanyRepo companyRepo;

  UpdateCompanyUseCase(this.companyRepo);

  Future<void> execute(CompanyEntity companyEntity, {required id}) async {
    final Company company = CompanyMapper().convert(companyEntity);
    await companyRepo.update<Company>(company, id: id);
  }
}
