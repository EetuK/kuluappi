import 'package:kuluappi/models/category.dart';
import 'package:mobx/mobx.dart';
part 'category_store.g.dart';

class CategoryStore extends _CategoryStoreBase with _$CategoryStore {}

abstract class _CategoryStoreBase with Store {
  @observable
  Category category;

  @observable
  List<Category> categories = [];

  @observable
  bool isLoading = false;

  @observable
  int year = 2020; // Hard coded for now

  @action
  void addCategory() {}

  @action
  Future<void> fetchCategories() async {
    this.isLoading = true;
    // Todo: Add error handling
    this.categories = await getAllCategories();
    print(this
        .categories
        .map((e) => e.name.toString() + " " + e.id.toString()));
    this.isLoading = false;
  }

  @action
  Future<Category> makeNewCategory(name) async {
    num newcat = await createCategory(name);
    return new Category(newcat, name);
  }

}
