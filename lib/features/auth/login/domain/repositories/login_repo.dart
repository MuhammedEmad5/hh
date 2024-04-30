
abstract class ILoginRepo {
  Future<dynamic> login(String email, String pass);
  Future<dynamic> saveLanguage(String key, String languageCode);




}