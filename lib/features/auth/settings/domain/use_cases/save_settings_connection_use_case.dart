import '../../data/models/settings_connection/setting_connection_model.dart';
import '../../data/repositories/settings_repo_impl.dart';


class SaveSettingConnectionUseCase {
  final SettingsRepo settingsRepo;

  SaveSettingConnectionUseCase( this.settingsRepo);

  Future<void> execute(String key, SettingConnection settingConnection) async {

    await settingsRepo.saveObjectSharedPreference(key, settingConnection);

  }
}