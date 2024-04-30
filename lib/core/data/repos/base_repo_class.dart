import '../../exceptions/sqlLite_Exception.dart';
import '../../model/json_model.dart';
import '../../utils/logger.dart';
import '../datasources/connection.dart';
import '../datasources/local_data_source/sqlLite/local_connection.dart';
import '../datasources/remote_data_source/remote_connection.dart';
import '../helper/query_helper.dart';

class BaseRepoClass {
  final IConnection _connection;

  BaseRepoClass(this._connection);

  Future<bool> insert<T extends JsonModel>(T data) async {
    Map<String, dynamic> jsonData = data.toJson();

    if (jsonData.isNotEmpty) {
      //Todo:- the Model Name must be same as table name
      String tableName = T.toString().toLowerCase();

      List<String> columnNames = [];
      List<dynamic> columnValues = [];

      jsonData.forEach((key, value) {
        columnNames.add(key);
        columnValues.add(value is String ? "'$value'" : value);
      });

      String columnsStr = columnNames.join(', ');
      String valuesStr = columnValues.join(', ');
      String sqlQuery =
          "INSERT INTO $tableName ($columnsStr) VALUES ($valuesStr)";

      return await _connection.writeQuery(sqlQuery);
    } else {
      throw SQLiteException(null, 'UnSupport type');
    }
  }

  Future<bool> update<T extends JsonModel>(T data, {required num id}) async {
    final String tableName = T.toString().toLowerCase();
    Map<String, dynamic> jsonData = data.toJson();
    if (jsonData.isEmpty) {
      throw SQLiteException(null, "Empty data");
    }
    List<String> updateValues = [];
    int skipNo = 4;
    if (tableName == 'companyunit') {
      skipNo = 2;
    }
    jsonData.entries.skip(skipNo).forEach((entry) {
      String key = entry.key;
      dynamic value = entry.value;
      updateValues.add("$key = ${value is String ? "'$value'" : value}");
    });

    String updateString = updateValues.join(', ');

    final columnsNamesList = await _getTableInfo(tableName);
    String sqlQuery = "UPDATE $tableName SET $updateString WHERE ";
    final fullQuery = QueryHelper.writeFullQuery(
        columnsNamesList: columnsNamesList, sqlQuery: sqlQuery, id: id);

    LoggerSingleton.logger.i("ENTERRRRR FUNCTION");
    LoggerSingleton.logger.i(fullQuery);

    return await _connection.writeQuery(fullQuery);
  }

  Future<bool> delete<T>({required num id}) async {
    LoggerSingleton.logger.i("ENTERRRRR Deleteeee");
    final tableName = T.toString().toLowerCase();
    if (tableName == "dynamic") {
      throw SQLiteException(null, "Undefine data type for delete ");
    }

    final columnsNamesList = await _getTableInfo(tableName);

    String sqlQuery = "DELETE FROM $tableName WHERE ";

    String fullQuery = QueryHelper.writeFullQuery(
        columnsNamesList: columnsNamesList, sqlQuery: sqlQuery, id: id);

    return await _connection.writeQuery(fullQuery);
  }

  Future<dynamic> getOne<T>({required num id}) async {
    final tableName = T.toString().toLowerCase();
    if (tableName == "dynamic") {
      throw SQLiteException(null, "Undefined data type for getOne ");
    }

    final columnsNamesList = await _getTableInfo(tableName);

    String sqlQuery = "SELECT * FROM $tableName WHERE ";

    String fullQuery = QueryHelper.writeFullQuery(
        columnsNamesList: columnsNamesList, sqlQuery: sqlQuery, id: id);

    return await _connection.readQuery(fullQuery);
  }

  Future<dynamic> getAll<T>() async {
    var tableName = T.toString().toLowerCase();
    tableName.contains('entity')
        ? tableName = tableName.split('entity')[0]
        : null;
    if (tableName == "dynamic") {
      throw SQLiteException(null, "Undefined data type for getAll");
    }

    final List result = await _connection.readQuery("SELECT * FROM $tableName");

    // LoggerSingleton.logger.d (result.toList());

    return result;
  }

  Future<List<dynamic>> _getTableInfo(String tableName) async {
    if (_connection is RemoteConnection) {
      LoggerSingleton.logger.e("IS REMOTEEEEEE");
      final List columnsAllInfoList = await _connection.readQuery(
          "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$tableName'");

      final List columnsNamesList =
          columnsAllInfoList.map((column) => column["COLUMN_NAME"]).toList();

      return columnsNamesList;
    }
    if (_connection is LocalConnection) {
      LoggerSingleton.logger.e("IS Locale");

      final List columnsAllInfoList =
          await _connection.readQuery("PRAGMA table_info($tableName)");
      final List columnsNamesList =
          columnsAllInfoList.map((column) => column["name"]).toList();

      return columnsNamesList;
    }

    throw SQLiteException(null, "Cannot get table info");
  }
}
