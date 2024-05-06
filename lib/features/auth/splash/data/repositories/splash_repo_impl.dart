import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../domain/repositories/splash_repo.dart';

class SplashRepo extends BaseRepoClass implements ISplashRepo {
  late IConnection _connection;
  final SfManager sfManager;

  SplashRepo(IConnection connection, this.sfManager) : super(connection) {
    _connection = connection;
  }

  @override
  Future<bool> getFirstTimeOpenTheApp(String key) async {
    return await sfManager.getBool(key);
  }

  @override
  Future<void> setFirstTimeOpenTheApp(String key, bool boolValue) async {
    await sfManager.saveBool(key, boolValue);
  }

  @override
  Future<String> getSavedLanguage(String key)async {
    final language = await sfManager.getString(key);

    return language ?? 'en';
  }
}
