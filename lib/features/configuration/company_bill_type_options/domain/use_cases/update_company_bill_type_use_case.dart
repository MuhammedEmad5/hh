import '../../data/mapper/company_bill_type_mapper.dart';
import '../../data/models/company_bill_type_model.dart';
import '../../data/repositories/company_bill_type_repo.dart';
import '../entities/company_bill_type_entity/company_bill_type_entity_model.dart';

class UpdateCompanyBillTypeUseCase {
  final CompanyBillTypeRepo companyBillTypeRepo;

  UpdateCompanyBillTypeUseCase({required this.companyBillTypeRepo});

  Future<void> execute(CompanyBillTypeEntity companyBillTypeEntity,
      {required id}) async {
    CompanyBillType companyBillType =
        CompanyBillTypeMapper().convert(companyBillTypeEntity);
    await companyBillTypeRepo.update<CompanyBillType>(companyBillType,
        id: id, skipNo: 3);
  }
}
