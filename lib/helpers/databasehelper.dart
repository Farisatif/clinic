import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    String dbname = 'clinic.db';
    String pathDB = join(path, dbname);

    return await openDatabase(
      pathDB,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE patients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        gender TEXT NOT NULL,
        phone TEXT NOT NULL,
        medical_notes TEXT
      )
    ''');
  }

  Future<int> insertData({
    required String table,
    required Map<String, Object?> values,
  }) async {
    final db = await database;
    return await db.insert(table, values);
  }

  Future<List<Map<String, Object?>>> readData({
    required String table,
  }) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> deleteData({
    required String table,
    required int id,
  }) async {
    final db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}