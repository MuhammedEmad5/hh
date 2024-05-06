import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/use_cases/get_first_time_open_app_use_case.dart';
import '../../domain/use_cases/get_language_use_case.dart';
import '../../domain/use_cases/set_first_time_open_app_use_case.dart';
import '../../domain/use_cases/set_initial_branch_use_case.dart';
import '../../domain/use_cases/set_initial_company_use_case.dart';
import '../../domain/use_cases/set_initial_user_use_case.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetFirstTimeOpenAppUseCase _getFirstTimeOpenAppUseCase;
  final SetFirstTimeOpenAppUseCase _setFirstTimeOpenAppUseCase;
  final SetInitialBranchUseCase _setInitialBranchUseCase;
  final SetInitialCompanyUseCase _setInitialCompanyUseCase;
  final SetInitialUserUseCase _setInitialUserUseCase;
  final GetLanguageUseCase _getLanguageUseCase;


  SplashCubit(this._getFirstTimeOpenAppUseCase, this._setFirstTimeOpenAppUseCase, this._setInitialBranchUseCase, this._setInitialCompanyUseCase, this._setInitialUserUseCase, this._getLanguageUseCase)
      : super(const SplashState.initial());


  void setInitialValuesInDb() async {

    try {
      await _setInitialUserUseCase.execute();
      await _setInitialBranchUseCase.execute();
      await _setInitialCompanyUseCase.execute();
      emit(const SplashState.successSetInitialValues());

    } on Exception catch (e) {
      emit( SplashState.error(e.toString()));
    }

  }

  void setFirstTimeOpenApp(String key) async {
    try {
      await _setFirstTimeOpenAppUseCase.execute(key);
    } catch (e) {
      emit( SplashState.error(e.toString()));
    }
  }
  void getFirstTimeOpenApp(String key) async {
    try {
     bool isFirstTime =  await _getFirstTimeOpenAppUseCase.execute(key);
      emit( SplashState.successGetFirstOpenBool(isFirstTime));
    } catch (e) {
      emit( SplashState.error(e.toString()));
    }
  }
  void getLanguage(String key) async {
    try {
      final language =  await _getLanguageUseCase.execute(key);
      emit( SplashState.successGetLanguage(language));
    } catch (e) {
      emit( SplashState.error(e.toString()));
    }
  }
}
