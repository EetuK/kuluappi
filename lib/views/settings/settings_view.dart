import 'package:flutter/material.dart';
import 'package:kuluappi/models/expense.dart';
import 'package:kuluappi/services/database.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/widgets/ModalLayout.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
//import 'package:kuluappi/widgets/ModalLayout.dart';

class SettingsView extends StatelessWidget {
  const SettingsView();

  @override
  Widget build(BuildContext context) {
    var db = ExpenseDatabase();
    final expenseStore = Provider.of<ExpenseStore>(context);
    return ModalLayout(
        title: "Settings",
        body: Padding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RaisedButton(
                child: Text("Delete all tables and init new"),
                onPressed: () async {
                  await db.clearDatabaseAndInit();
                  await expenseStore.fetchAvailableYears();
                },
              ),
              RaisedButton(
                child: Text("Add dummy data"),
                onPressed: () => {db.addDummyData()},
              ),
              RaisedButton(
                child: Text("Test connection"),
                onPressed: () async {
                  var data = await getAllExpenses();
                  Toast.show(
                      " ${data.map((e) => e.description.toString()).join(",")}",
                      context,
                      duration: Toast.LENGTH_LONG,
                      gravity: Toast.BOTTOM);
                },
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
        ));
  }
}
