import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'donor_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('donors.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE donors (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      gender TEXT NOT NULL,
      age INTEGER NOT NULL,
      bloodGroup TEXT NOT NULL,
      lastDonated TEXT NOT NULL,
      mobileNumber TEXT NOT NULL
    )
    ''');
  }

  Future<int> insertDonor(Donor donor) async {
    final db = await instance.database;
    return await db.insert('donors', donor.toMap());
  }

  Future<List<Donor>> getAllDonors() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('donors');
    return List.generate(maps.length, (i) => Donor.fromMap(maps[i]));
  }
  Future<int> deleteDonor(int id) async {
    final db = await database;
    return await db.delete('donors', where: 'id = ?', whereArgs: [id]);
  }
}
