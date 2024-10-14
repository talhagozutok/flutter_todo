import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:task_api/task_api.dart';

class SqfliteTaskApi extends TaskApi {
  static const String _tableName = 'tasks';
  Database? _db;

  Future<void> _initDb() async {
    if (_db != null) return;

    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
      var dbPath = 'tasks.db';
      _db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    } else if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      final databaseFactory = databaseFactoryFfi;
      final appDocumentsDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentsDir.path, "databases", "tasks.db");
      _db = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(version: 1, onCreate: _onCreate),
      );
    } else if (Platform.isAndroid || Platform.isIOS) {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      final dbPath = join(documentsDirectory.path, "tasks.db");
      _db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    }
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute('''
    CREATE TABLE $_tableName (
      id TEXT PRIMARY KEY,
      title TEXT,
      description TEXT,
      date TEXT,
      isCompleted INTEGER
    )
  ''');
  }

  @override
  Future<void> saveTask(Task task) async {
    await _initDb();

    await _db!.insert(
      _tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Task>> getTasks() async {
    await _initDb();

    final List<Map<String, dynamic>> taskMaps = await _db!.query(_tableName);
    final tasks = taskMaps.map((taskMap) => Task.fromMap(taskMap)).toList();

    return tasks;
  }

  @override
  Future<void> deleteTask(String id) async {
    await _initDb();

    await _db!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    await _db?.close();
  }
}
