import '../../data/models/company_unit_model.dart';
import '../../data/repositories/company_unit_repo.dart';

class DeleteCompanyUnitUseCase {
  final CompanyUnitRepo companyUnitRepo;

  DeleteCompanyUnitUseCase({required this.companyUnitRepo});

  Future<void> execute({required double id}) async {
    await companyUnitRepo.delete<CompanyUnit>(id: id);
  }
}
