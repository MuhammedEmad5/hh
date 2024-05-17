import '../../data/models/company_bill_type_model.dart';
import '../../data/repositories/company_bill_type_repo.dart';

class ReadCompanyBillTypeUseCase {
  final CompanyBillTypeRepo companyBillTypeRepo;

  ReadCompanyBillTypeUseCase({required this.companyBillTypeRepo});

  Future<CompanyBillType> execute({required double id}) async {
    final companyBillTypeJsonArr =
        await companyBillTypeRepo.getOne<CompanyBillType>(id: id);
    final companyBillTypeData = companyBillTypeJsonArr.first;
    final companyBillType = CompanyBillType.fromJson(companyBillTypeData);

    return companyBillType;
  }
}
