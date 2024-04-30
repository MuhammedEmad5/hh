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