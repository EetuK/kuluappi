// Here all db related stuff

// Init / connect function

// get db instance

import 'package:sqflite/sqflite.dart';
import '../constants.dart' as Constants;

class Db {
  static final Db _singleton = Db._internal();

  factory Db() {
    return _singleton;
  }

  Db._internal();

  Future<Database> _db;

  Future<Database> getDb() {
    if (_db == null) {
      _db = openDatabase(Constants.DB_URL);
    }
    return _db;
  }
}
