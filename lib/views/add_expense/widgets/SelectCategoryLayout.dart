import 'package:flutter/material.dart';
import 'package:kuluappi/views/add_expense/widgets/InputExpenseLayout.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/stores/category_store.dart';
import 'package:kuluappi/models/category.dart';
import 'package:provider/provider.dart';

class SelectCategoryLayout extends StatelessWidget {
  const SelectCategoryLayout(
      {this.title, this.body, this.expenseStore, this.categoryStore});

  final String title;
  final Widget body;
  final ExpenseStore expenseStore;
  final CategoryStore categoryStore;

  static TextEditingController categoryController = TextEditingController();
  //static const List<String> wipCategories = ["ruoka", "bensa", "laskut"];

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);
    final categoryStore = Provider.of<CategoryStore>(context);
    categoryStore.fetchCategories();
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Builder(
            builder: (context) => Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          this.title,
                          textScaleFactor: 1.7,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          tooltip: 'Close',
                          onPressed: () => {Navigator.pop(context)},
                        ),
                      ]),
                  margin: EdgeInsets.only(top: statusBarHeight),
                  padding: EdgeInsets.only(left: 15),
                )),
      ),
      //body: this.body,
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (categoryStore.categories.length > 0)
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "Select category for your expense",
                    textScaleFactor: 1.5,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryStore.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Container(
                        //padding: EdgeInsets.all(10),
                        child: TextButton(
                            child: Text(categoryStore.categories[index].name),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InputExpenseLayout(
                                          selectedcategory:
                                              categoryStore.categories[index],
                                          expenseStore: expenseStore,
                                        )),
                              );
                            }),
                      );
                    },
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Or create a new category",
                    textScaleFactor: 1.5,
                  )),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          child: TextField(
                            controller: categoryController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: "Enter new category",
                            ),
                          )),
                      RaisedButton(
                          child: Text("+"),
                          shape:
                              CircleBorder(side: BorderSide(color: Colors.red)),
                          color: Colors.red[400],
                          textColor: Colors.white,
                          onPressed: () async {
                            Category newcat = await categoryStore
                                .makeNewCategory(categoryController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputExpenseLayout(
                                        selectedcategory: newcat,
                                        expenseStore: expenseStore,
                                      )),
                            );
                          }),
                    ],
                  ))
            ]),
      ),
      backgroundColor: Colors.orange[50],
    );
  }
}
