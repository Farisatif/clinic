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

    return await openDatabase(pathDB, version: 1, onCreate: _onCreate);
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

  Future<List<Map<String, Object?>>> readData({required String table}) async {
    final db = await database;
    return await db.query(table);
  }

  Future<List<Map<String, Object?>>> readDataById({
    required String table,
    required int id,
  }) async {
    final db = await database;
    return await db.query(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateData({
    required String table,
    required Map<String, Object?> values,
    required int id,
  }) async {
    final db = await database;
    return await db.update(table, values, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteData({required String table, required int id}) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}






















//---------------------------------------------------

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   DatabaseHelper._();
//   static final DatabaseHelper instance = DatabaseHelper._();

//   Database? _database;

//   Future<Database> initDb() async {
//     String path = await getDatabasesPath();
//     String dbname = 'clinic.db';
//     String pathDB = join(path, dbname);

//     return await openDatabase(pathDB, version: 1, onCreate: _onCreate);
//   }

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDb();
//     return _database!;
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE patients (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT NOT NULL,
//         age INTEGER NOT NULL,
//         gender TEXT NOT NULL,
//         phone TEXT NOT NULL,
//         medical_notes TEXT
//       )
//     ''');
//   }

//   Future<int> insertData({
//     required String table,
//     required Map<String, Object?> values,
//   }) async {
//     final db = await database;
//     return await db.insert(table, values);
//   }

//   Future<List<Map<String, Object?>>> readData({required String table}) async {
//     final db = await database;
//     return await db.query(table);
//   }

//   //---------------------------

//   //read by id
//   readDataById({required String table, required int id}) async {
//     // Implementation for reading data
//     Database? db = await instance.database;
//     List<Map> response = await db.query(table, where: 'id = $id');
//     return response;
//   }

//   //   //update data
//   updateData({
//     required String table,
//     required Map<String, Object> values,
//     required int id,
//   }) async {
//     // Implementation for updating data
//     Database? db = await instance.database;

//     //db?.rowupdate(sql);هذا المتعبه
//     int response = await db.update(table, values, where: 'id = $id');
//     //id ا اتاكد انه تم التعديل
//     return response;
//   }

//   //delete data
//   deleteData({required String table, required int id}) async {
//     // Implementation for deleting data
//     Database? db = await instance.database;

//     //db?.rowdelete(sql);هذا المتعبه
//     int response = await db.delete(table, where: 'id = $id');
//     //id ا اتاكد انه انحذف
//     return response;
//   }
// }




// //-------------------------------------------------
// // class DatabaseHelper {
// //   DatabaseHelper._();
// //   static final DatabaseHelper instance = DatabaseHelper._();

// //   Database? _database;

// //   // Initialize the database
// //   initDb() async {
// //     String path = await getDatabasesPath(); // Define your database path here
// //     String dbname = 'clinic.db';
// //     String pathDB = join(path, dbname);
// //     return await openDatabase(pathDB, version: 1, onCreate: _onCreate);
// //   }

// //   Future<Database?> get database async {
// //     if (_database != null) return _database;
// //     _database = await initDb();
// //     return _database;
// //   }

// //   _onCreate(Database db, int version) async {
// //     await db.execute('''
// //       CREATE TABLE patients (
// //         id INTEGER PRIMARY KEY AUTOINCREMENT,
// //         name TEXT NOT NULL,
// //         age INTEGER NOT NULL,
// //         gender TEXT NOT NULL,
// //         phone TEXT NOT NULL,
// //         medical_notes TEXT
// //         )
// // ''');
// //   }

// //   //CRUD Operations C create R Read U Update D Delete
// //   insertData({
// //     required String table,
// //     required Map<String, Object> values,
// //   }) async {
// //     // Implementation for inserting data
// //     Database? db = await instance.database;

// //     //db?.rowinsert(sql);هذا المتعبه
// //     int response = await db!.insert(table, values);
// //     //id ا اتاكد انه انضاف
// //     return response;
// //   }

// //   //read all data
// //   readData({required String table}) async {
// //     // Implementation for reading data
// //     Database? db = await instance.database;
// //     //
// //     List<Map> response = await db!.query(table);
// //     return response;
// //   }

// //   //read by id
// //   readDataById({required String table, required int id}) async {
// //     // Implementation for reading data
// //     Database? db = await instance.database;
// //     List<Map> response = await db!.query(table, where: 'id = $id');
// //     return response;
// //   }

// //   //update data
// //   updateData({
// //     required String table,
// //     required Map<String, Object> values,
// //     required int id,
// //   }) async {
// //     // Implementation for updating data
// //     Database? db = await instance.database;

// //     //db?.rowupdate(sql);هذا المتعبه
// //     int response = await db!.update(table, values, where: 'id = $id');
// //     //id ا اتاكد انه تم التعديل
// //     return response;
// //   }

// //   //delete data
// //   deleteData({required String table, required int id}) async {
// //     // Implementation for deleting data
// //     Database? db = await instance.database;

// //     //db?.rowdelete(sql);هذا المتعبه
// //     int response = await db!.delete(table, where: 'id = $id');
// //     //id ا اتاكد انه انحذف
// //     return response;
// //   }
// // }

