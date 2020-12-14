import 'package:kuluappi/services/database.dart';

class Category {
  num id;
  String name;


  Category(num id, String name) {
    this.id = id;
    this.name = name;
  }

  Category.fromDb(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

}

// Look e.g. expense.dart file

Future<List<Category>> getAllCategories() async {
  var client = await ExpenseDatabase().db;
  var response = await client.rawQuery('SELECT * FROM categories');
  print(response);
  return response.map((e) => Category.fromDb(e)).toList();
}

Future<num> createCategory(name) async {
  var client = await ExpenseDatabase().db;
  var response = await client.rawInsert('INSERT INTO categories(name) VALUES(?)', [name]);
  print(response);
  return response;
}