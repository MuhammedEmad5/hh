abstract class IConnection{
  Future<bool> testConnect();
  Future<List<dynamic>> readQuery(String query,[bool convertFromSQLiteToSQLServer]);
  Future<bool> writeQuery(String query,[bool convertFromSQLiteToSQLServer]);
}
