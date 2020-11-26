import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseDatabase {
  static final ExpenseDatabase _instance = ExpenseDatabase._();
  static Database _database;

  ExpenseDatabase._();

  factory ExpenseDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    var dbBasePath = await getDatabasesPath();

    String dbPath = join(dbBasePath, 'database1.db');
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await _createInitialDatabase(db);
    return _addDummyData(db);
  }

  Future<void> _createInitialDatabase(Database db) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY,
        name VARCHAR UNIQUE NOT NULL
      );
      ''');
    await db.execute('''
      CREATE TABLE expenses (
        id INTEGER PRIMARY KEY,
        sum float NOT NULL,
        description TEXT NOT NULL,	
        date_created datetime NOT NULL,
        category_id INTEGER NOT NULL,
        CONSTRAINT category_reference FOREIGN KEY (category_id) REFERENCES categories (id)
      );
    ''');

    await db.execute('''
      CREATE TRIGGER delete_categories
        AFTER DELETE ON expenses
          WHEN (
            SELECT COUNT(*) FROM expenses 
            WHERE category_id = old.category_id 
            LIMIT 1
          ) = 0
        BEGIN
          DELETE FROM categories WHERE id = old.category_id;
        END;
    ''');

    print("Database was created!");
  }

  Future<void> _addDummyData(Database db) async {
    await db.rawInsert('INSERT INTO categories (name) VALUES ("Kaljat")');
    await db.rawInsert('INSERT INTO categories (name) VALUES ("Ruoka")');
    await db.rawInsert('INSERT INTO categories (name) VALUES ("Auto")');

    await db.rawInsert(
        '''INSERT INTO expenses (sum, description, date_created, category_id) VALUES 
        (10, "Kaljaa", datetime("now"), 1), 
        (4.60, "Makkaraa", datetime("now"), 2),
        (5, "Bensaa", datetime('now','+40 day','localtime'), 3),
        (60, "Lisää bensaa", datetime('now','+40 day','localtime'), 3)
      ''');

    print("Added dummy data to database");
  }

  Future<void> clearDatabaseAndInit() async {
    var client = await db;
    await client.execute("DROP TABLE IF EXISTS expenses");
    await client.execute("DROP TABLE IF EXISTS categories");
    await client.execute("DROP TRIGGER IF EXISTS delete_categories");
    return _createInitialDatabase(client);
  }

  Future<void> addDummyData() async {
    var client = await db;
    await _addDummyData(client);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
