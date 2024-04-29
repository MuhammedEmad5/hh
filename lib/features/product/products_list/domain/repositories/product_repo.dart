abstract class IProductRepo {
  Future<dynamic> getLastIndex(String tName, String key);
  Future<dynamic> getDataCount();
}
