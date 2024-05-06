abstract class ISplashRepo {
  Future<void> setFirstTimeOpenTheApp(String key, bool boolValue);
  Future<bool> getFirstTimeOpenTheApp(String key);
  Future<String> getSavedLanguage(String key);


}