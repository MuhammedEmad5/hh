import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/login_repo.dart';
import '../../queries/login_queries.dart';

class LoginRepo extends BaseRepoClass implements ILoginRepo {
  late IConnection _connection;

  final SfManager sfManager;

  LoginRepo(IConnection connection, this.sfManager) : super(connection) {
    _connection = connection;
  }

  @override
  Future<dynamic> login(String email, String pass) async {
    try {
      final result = await _connection.readQuery(LoginQueries.login(email, pass));
      LoggerSingleton.logger.w(result);

      return result;
    } on Exception catch (e) {

      LoggerSingleton.logger.e(e);
    }
   // return result;
  }

  @override
  Future saveLanguage(String key, String languageCode) async{
    await sfManager.saveString(key, languageCode);

  }


}
