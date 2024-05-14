import '../../data/repositories/company_bill_type_repo.dart';
import '../entities/company_bill_type_entity/company_bill_type_entity_model.dart';

class ReadAllCompanyBillTypesUseCase {
  final CompanyBillTypeRepo companyBillTypeRepo;

  ReadAllCompanyBillTypesUseCase({required this.companyBillTypeRepo});

  Future<List<CompanyBillTypeEntity>> execute() async {
    final List<dynamic> companyUnitJsonArr =
        await companyBillTypeRepo.getAll<CompanyBillTypeEntity>();
    final companyUnits = companyUnitJsonArr
        .map((unit) => CompanyBillTypeEntity.fromJson(unit))
        .toList();

    return companyUnits;
  }
}
