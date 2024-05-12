
import '../../data/mapper/company_mapper.dart';
import '../../data/models/company_model.dart';
import '../../data/repositories/company_repo_impl.dart';
import '../entities/company_general_entity/company_entity.dart';

class ReadAllCompanyUseCase {
  final CompanyRepo companyRepo;

  ReadAllCompanyUseCase(this.companyRepo);

  Future<List<CompanyEntity>> execute() async {
    final List<dynamic> companyJsonArr = await companyRepo.getAll<Company>();
    final companyObjects =
        companyJsonArr.map((item) => Company.fromJson(item)).toList();
    List<CompanyEntity> companyGeneralList = [];
    for (Company item in companyObjects) {
      companyGeneralList.add(CompanyMapper().convert(item));
    }
    return companyGeneralList;
  }
}
