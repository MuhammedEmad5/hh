part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.successFetchDataBase(List<String> dbNames) = SuccessFetchDataBase;
  const factory SettingsState.successSettingConnection(SettingConnection? settingConnection) = _SuccessSettingConnection;
  const factory SettingsState.error(String errorMessage) = _Error;

}
