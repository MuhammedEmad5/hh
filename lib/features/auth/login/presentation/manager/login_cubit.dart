import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/save_language_use_case.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final SaveLanguageUseCase _saveLanguageUseCase;

  LoginCubit(this._loginUseCase, this._saveLanguageUseCase)
      : super(const LoginState.initial());

  void login(String email, String pass) async {
    emit(const LoginState.loading());
    try {
      await _loginUseCase.execute(email, pass);
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  void saveLanguage(String key, String languageEnum) async {
    try {
      await _saveLanguageUseCase.execute(key, languageEnum);

    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
