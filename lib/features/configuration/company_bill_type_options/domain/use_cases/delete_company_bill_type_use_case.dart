import '../../data/models/company_bill_type_model.dart';
import '../../data/repositories/company_bill_type_repo.dart';

class DeleteCompanyBillTypeUseCase {
  final CompanyBillTypeRepo companyBillTypeRepo;

  DeleteCompanyBillTypeUseCase({required this.companyBillTypeRepo});

  Future<void> execute({required double id}) async {
    await companyBillTypeRepo.delete<CompanyBillType>(id: id);
  }
}
