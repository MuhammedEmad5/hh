part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.successGetFirstOpenBool(bool isFirstTime) = _SuccessGetFirstOpenBool;
  const factory SplashState.successSetInitialValues() = _SuccessSetInitialValues;
  const factory SplashState.successGetLanguage(String languageEnum) = _SuccessGetLanguage;
  const factory SplashState.error(String errorMessage) = _Error;
}
