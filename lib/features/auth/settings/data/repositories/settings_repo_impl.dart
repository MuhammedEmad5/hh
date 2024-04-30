import 'package:InvoiceF_ClientVendor/features/auth/settings/queries/settings_queries.dart';

import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../../login/queries/login_queries.dart';
import '../../domain/repositories/settings_repo.dart';

class SettingsRepo extends BaseRepoClass implements ISettingsRepo{

  late IConnection _connection;

  final SfManager  sfManager;
  SettingsRepo(IConnection connection, this.sfManager) : super(connection){

    _connection = connection;
  }
  @override
  Future getAllDb() async{
    final  result = await _connection.readQuery(SettingsQueries.getAllDb);
    return result;
  }

  @override
  Future saveObjectSharedPreference<T>(String key, T object) async {
    await sfManager.saveObject(key, object);
  }

  @override
  Future<T?> getObjectSharedPreference<T>(String key,T Function(Map<String, dynamic>) fromJson) async {

    final result = await sfManager.getObject(key, fromJson);

    //  LoggerSingleton.logger.e("$result in repo");

    return result;

  }




}