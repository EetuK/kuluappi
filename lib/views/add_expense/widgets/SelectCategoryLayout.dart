import 'package:flutter/material.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/add_expense/widgets/InputExpenseLayout.dart';

class SelectCategoryLayout extends StatelessWidget {
  const SelectCategoryLayout({this.title, this.body, this.expenseStore});

  final String title;
  final Widget body;
  final ExpenseStore expenseStore;
  static const List<String> wipCategories = ["ruoka", "bensa", "laskut"];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children : [

            Padding(
            padding : EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text(
              "Select category for your expense",
              textScaleFactor: 1.5,
                ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:
                Card(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                  itemCount: wipCategories.length,
                  itemBuilder: (BuildContext context, int index){
                    return new Container(
                      padding: EdgeInsets.all(10),
                      child: Text(wipCategories[index]),
                    );
                  },
                  padding: const EdgeInsets.all(10),
                ),
          ),),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Or create a new category",
                textScaleFactor: 1.5,
              )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                Container (
                  width: 250,
                  child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(),),
                    hintText: "Enter new category",
                  ),
                )),
                  RaisedButton(
                    child: Text("+"),
                    shape: CircleBorder(

                      side: BorderSide(color: Colors.red)
                    ),
                    color: Colors.red[400],
                    textColor: Colors.white,
                    onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputExpenseLayout()),
                    );}
                  ),
              ],
            ))
        ]
          ),
      backgroundColor: Colors.orange[50],
    );
  }
}
