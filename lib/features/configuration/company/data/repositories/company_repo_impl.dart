import '../../../../../core/data/repos/base_repo_class.dart';
import '../../domain/repositories/company_repo.dart';

class CompanyRepo extends BaseRepoClass implements ICompanyRepo {
  CompanyRepo(super.connection);
}
