import 'package:InvoiceF_Bills/core/data/datasources/local_data_source/sqlLite/sqlLite_manager.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../exceptions/sqlLite_Exception.dart';
import '../../../../utils/logger.dart';
import '../../connection.dart';

class LocalConnection implements IConnection {
  @override
  Future<List> readQuery(String query,
      [convertFromSQLiteToSQLServer = false]) async {
    final db = await SqlLiteManager.instance.database;
    LoggerSingleton.logger.i(query);
    try {
      return await db.rawQuery(query);
    } on DatabaseException catch (e) {
      throw SQLiteException(e);
    } catch (e) {
      throw SQLiteException(null, e.toString());
    }
  }

  @override
  Future<bool> testConnect() async {
    final db = await SqlLiteManager.instance.database;

    return db.isOpen;
  }

  @override
  Future<bool> writeQuery(String query,
      [convertFromSQLiteToSQLServer = false]) async {
    final db = await SqlLiteManager.instance.database;
    try {
      await db.transaction((txn) async {
        await txn.rawInsert(query);
      });

      return true;
    } on DatabaseException catch (e) {
      LoggerSingleton.logger.e(e);
      throw SQLiteException(e, e.toString());
    } catch (e) {
      LoggerSingleton.logger.e(e);
      throw SQLiteException(null, e.toString());
    }
  }
}
