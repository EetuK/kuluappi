import 'package:flutter/material.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/home/home_view.dart';

class InputExpenseLayout extends StatelessWidget {
  const InputExpenseLayout({@required this.category, @required this.expenseStore});

  final ExpenseStore expenseStore;
  final String category;
  static TextEditingController sumController = TextEditingController();
  static TextEditingController dateController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
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
                      "Add expense",
                      textScaleFactor: 1.7,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      tooltip: 'Close',
                      onPressed: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                      )},
                    ),
                  ]),
              margin: EdgeInsets.only(top: statusBarHeight),
              padding: EdgeInsets.only(left: 15),
            )),
      ),
      //body: this.body,
      body: SingleChildScrollView( child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

          children : [
            Padding(
              padding: EdgeInsets.all(0),
              child:
              Card(
                color: Colors.white,
                child: Padding(padding: EdgeInsets.all(10), child:
                  Text(
                  //this.category
                  //"WIP category"
                    "Category: "+category,
                    textScaleFactor: 1.5
                ))

              ),),
            Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
                child: Text(
                  "Add sum",
                  textScaleFactor: 1.5,
                )
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(),),
                    hintText: "Enter sum",
                  ),
                  keyboardType: TextInputType.number,
                  controller: sumController,
                ),
                ),

            Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
                child: Text(
                  "Date of the expense",
                  textScaleFactor: 1.5,
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(),),
                  hintText: "Enter date",
                ),
                readOnly: true,
                controller: dateController,
                onTap: () async {
                  var date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2100));
                  dateController.text = date.toString().substring(0,10);
                }
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
                child: Text(
                  "Description",
                  textScaleFactor: 1.5,
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(),),
                  hintText: "Enter description",
                ),
                controller: descriptionController,
              ),
            ),

            Padding(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                        child: Text("SAVE"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.red)
                        ),
                        color: Colors.red[400],
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );}
                    ),

                )


          ]
      ),),
      backgroundColor: Colors.orange[50],
    );
  }
}
