
import '../../helper/sql_queries.dart';
import '../connection.dart';
import 'dio_manager.dart';

void main() {
  final list = RemoteConnection()
      .readQuery(SqlQueries.getAllDb);
}

class RemoteConnection implements IConnection {
  @override
  Future<bool> writeQuery(String query,
      [convertFromSQLiteToSQLServer = false]) async {
    //LoggerSingleton.logger.e(query);
    try {
      final response = await DioManager.dio.post("", data: {"query": query});
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List> readQuery(String query,
      [convertFromSQLiteToSQLServer = false]) async {
    try {
      final response = await DioManager.dio.post("", data: {"query": query});
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> testConnect() {
    // TODO: Execute SQL Query Here
    throw UnimplementedError();
  }

  convertFromSQLite(String sqliteQuery) {}
}
