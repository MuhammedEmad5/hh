import 'package:sqflite/sqflite.dart';

class SQLiteException implements Exception {
  final String? message;
  final DatabaseException? databaseException;

  SQLiteException([this.databaseException, this.message]);

  @override
  String toString() {
    if (databaseException != null) {
      return 'SQLiteException: ${validateError(databaseException!)}';
    } else {
      return 'SQLiteException: ${message ?? "Undefine error"}';
    }
  }
}

String validateError(DatabaseException dbException) {
  if (dbException.isUniqueConstraintError()) {
    return "Unique element is define before";
  }
  if (dbException.isDatabaseClosedError()) {
    return "DataBase is Closed";
  }
  if (dbException.isDuplicateColumnError()) {
    return "Duplicate Column";
  }
  if (dbException.isNoSuchTableError()) {
    return "No Table with this name";
  }
  if (dbException.isNotNullConstraintError()) {
    return "Filled must be not null";
  }
  if (dbException.isOpenFailedError()) {
    return "Cannot open DataBase";
  }

  return 'Undefine error';
}
