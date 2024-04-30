import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/settings_connection/setting_connection_model.dart';
import '../../domain/use_cases/get_settings_connection_use_case.dart';
import '../../domain/use_cases/read_all_db_use_case.dart';
import '../../domain/use_cases/save_settings_connection_use_case.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {

  final ReadAllDbUseCase _readAllDbUseCase;

  final SaveSettingConnectionUseCase _saveSettingConnectionUseCase;

  final GetSettingConnectionUseCase _getSettingConnectionUseCase;

  SettingsCubit(
      this._readAllDbUseCase,
      this._saveSettingConnectionUseCase,
      this._getSettingConnectionUseCase
      ) : super(const SettingsState.initial());




  void getAllDb() async {
    emit(const SettingsState.loading());
    try {
      final namesList = await _readAllDbUseCase.execute();
      emit(SettingsState.successFetchDataBase(namesList));
    } catch (e) {
      emit(SettingsState.error(e.toString()));
    }
  }

  void savaSettingConnection(
      String key, SettingConnection settingConnection) async {
    try {
      await _saveSettingConnectionUseCase.execute(key, settingConnection);
    } catch (e) {
      emit(SettingsState.error(e.toString()));
    }
  }

  void getSettingsConnection(String key) async {
    try {
      final settingConnection = await _getSettingConnectionUseCase.execute(key);

    //  LoggerSingleton.logger.i("${settingConnection?.toJson()} callled");
      emit(SettingsState.successSettingConnection(settingConnection));
      // emit(AuthState.initial());
    } catch (e) {
      emit(SettingsState.error(e.toString()));
    }
  }

}
