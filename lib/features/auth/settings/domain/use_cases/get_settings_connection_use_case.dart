import '../../../../../core/utils/logger.dart';
import '../../data/models/settings_connection/setting_connection_model.dart';
import '../../data/repositories/settings_repo_impl.dart';

class GetSettingConnectionUseCase {
  final SettingsRepo settingsRepo;

  GetSettingConnectionUseCase(this.settingsRepo);

  Future<SettingConnection?> execute(String key) async {

   final SettingConnection? settingConnection =   await settingsRepo.
   getObjectSharedPreference<SettingConnection>(key,
   (json) => SettingConnection.fromJson(json));
  // LoggerSingleton.logger.e("$settingConnection in use case");


   // if (settingConnection == null) {
   //   throw Exception("Cannot get saved settings !");
   // }

   return settingConnection;

  }
}