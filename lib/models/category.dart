import 'package:kuluappi/services/database.dart';

class Category {
  num id;
  String name;
  String createdAt;
  String modifiedAt;

  Category(num id, String name, String createdAt, String modifiedAt) {
    this.id = id;
    this.name = name;
    this.createdAt = createdAt;
    this.modifiedAt = modifiedAt;
  }

  Category.fromDb(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

}

// Look e.g. expense.dart file

Future<List<Category>> getAllCategories() async {
  var client = await ExpenseDatabase().db;
  var response = await client.rawQuery('SELECT * FROM expenses');
  print(response);
  return response.map((e) => Category.fromDb(e)).toList();
}
