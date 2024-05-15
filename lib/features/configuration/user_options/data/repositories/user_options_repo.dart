import 'package:InvoiceF/core/constants/sf_keys.dart';

import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../domain/repositories/user_options_repo.dart';

class UserOptionsRepo extends BaseRepoClass implements IUserOptionsRepo {
  final SfManager sfManager;
  UserOptionsRepo(super.connection, this.sfManager);

  @override
  Future<int?> getStartListThemes(String key) async {
    return await sfManager.getInt(key);
  }

  @override
  Future<int?> getStartPageThemes(String key) async {
    return await sfManager.getInt(key);
  }

  @override
  void insertStartListThemes(int startListTheme, String key) async {
    await sfManager.saveInt(key, startListTheme);
  }

  @override
  void insertStartPageThemes(int startPageTheme, String key) async {
    await sfManager.saveInt(key, startPageTheme);
  }
}
