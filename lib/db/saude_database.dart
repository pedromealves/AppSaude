import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/model/model.dart';
//import 'package:sqflite_database_exemple/model/note.dart';

class SaudeDatabase {
  static final SaudeDatabase instance = SaudeDatabase._init();

  SaudeDatabase._init(); // Private Constructor

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('saude.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath =
        await getDatabasesPath(); // Stores the database in the file storage system
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createBD);
  }

  // Types: https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md
  Future _createBD(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const blobType = 'BLOB';
    const integerType = 'INTEGER';

    await db.execute(''' 
      CREATE TABLE $tableSaude (
        ${UserFields.id} $idType,
        ${UserFields.nome} $textType,
        ${UserFields.imagem} $blobType,
        ${UserFields.idade} $integerType
      )
    ''');
  }

  Future<User> createUser(User user) async {
    final db = await instance.database;

    final userData = await db.insert(tableSaude, user.toJson());

    return user.copy(id: userData);
  }

  Future<User?> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSaude,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;

    return db.update(
      tableSaude,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return db.delete(
      tableSaude,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
