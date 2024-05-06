abstract class ISettingsRepo{

  Future<dynamic> getAllDb();
  Future<void> saveObjectSharedPreference<T>(String key, T object);
  Future<T?> getObjectSharedPreference<T>(String key,T Function(Map<String, dynamic>) fromJson);


}