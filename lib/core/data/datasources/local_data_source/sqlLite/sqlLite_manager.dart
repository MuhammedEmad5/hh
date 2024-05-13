import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../utils/logger.dart';

class SqlLiteManager {
  static final SqlLiteManager instance = SqlLiteManager._internal();
  static Database? _database;

  SqlLiteManager._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    LoggerSingleton.logger.i(documentsDirectory.path);
    String path = "${documentsDirectory.path}\\einvoice\\db_files\\enivoice.db";
    LoggerSingleton.logger.i(path);
    dynamic bytes;

    bool exists;
    if (Platform.isWindows) {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      exists = await databaseFactory.databaseExists(
        path,
      );
    } else {
      exists = await databaseExists(path);
    }

    if (!exists) {
      if (Platform.isWindows) {
        bytes = await File('assets/db_files/enivoice.db').readAsBytes();
      } else {
        ByteData data = await rootBundle.load("assets/db_files/enivoice.db");
        bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      }
      var appPath = Directory('${documentsDirectory.path}\\einvoice');
      appPath.create();
      var dBPath = Directory('${documentsDirectory.path}\\einvoice\\db_files');
      dBPath.create();
      print('DIRECTORY CREATED: $dBPath');
      try {
        await File(path).writeAsBytes(bytes);
        print('--------WRITTEN-------');
      } on FileSystemException catch (e) {
        throw Exception("Copy Failed: $e");
      }
    }

    return openDatabase(path);
  }
}
