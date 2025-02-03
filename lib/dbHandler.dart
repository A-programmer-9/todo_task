import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHandler {
  static Database? _database;

  static final DBHandler instance = DBHandler._init();

  DBHandler._init();

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "todos.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Todos (todo_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, Description Text)");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    return _database!.query("Todos");
  }

  Future insertInDB(String table, Map<String, dynamic> values) async {
    await _database!
        .insert(table, values, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future deleteATodo(String table, String whereKey, dynamic whereArg) async {
    await _database!
        .delete(table, where: "$whereKey = ?", whereArgs: [whereArg]);
  }
}
