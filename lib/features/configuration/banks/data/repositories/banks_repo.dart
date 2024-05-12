import 'package:InvoiceF/features/configuration/banks/domain/repositories/banks_repo.dart';

import '../../../../../core/data/repos/base_repo_class.dart';

class BanksRepo extends BaseRepoClass implements IBanksRepo {
  BanksRepo(super.connection);
}