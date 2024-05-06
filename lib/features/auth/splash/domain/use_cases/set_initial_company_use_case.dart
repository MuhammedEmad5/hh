import '../../../../configuration/company/data/mapper/company_mapper.dart';
import '../../../../configuration/company/data/models/company_model.dart';
import '../../../../configuration/company/domain/entities/company_general_entity/company_entity.dart';
import '../../data/repositories/splash_repo_impl.dart';

class SetInitialCompanyUseCase {
  final SplashRepo splashRepo;

  SetInitialCompanyUseCase(this.splashRepo);

  Future<void> execute() async {
    final initialCompanyEntity = CompanyEntity(
        companyNo: 1,
        arabicName: "الشركة",
        englishName: "My Company"
    );

    final Company company = CompanyMapper().convert(initialCompanyEntity);
    await splashRepo.insert(company);
  }
}