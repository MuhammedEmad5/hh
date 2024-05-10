import '../../data/mapper/company_bill_type_mapper.dart';
import '../../data/models/company_bill_type_model.dart';
import '../../data/repositories/company_bill_type_repo.dart';
import '../entities/company_bill_type_entity/company_bill_type_entity_model.dart';

class CreateCompanyBillTypeUseCase {
  final CompanyBillTypeRepo companyBillTypeRepo;

  CreateCompanyBillTypeUseCase({required this.companyBillTypeRepo});

  Future<void> execute(CompanyBillTypeEntity companyBillTypeEntity) async {
    CompanyBillType companyBillType =
        CompanyBillTypeMapper().convert(companyBillTypeEntity);
    await companyBillTypeRepo.insert(companyBillType);
  }
}
