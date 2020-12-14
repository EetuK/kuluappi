//import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/models/expense.dart';
import 'package:kuluappi/models/category.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/stores/category_store.dart';
import 'package:provider/provider.dart';
import 'package:kuluappi/views/modify_expense/modify_expense_view.dart';

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final categoryStore = Provider.of<CategoryStore>(context);
final expenseStore = Provider.of<ExpenseStore>(context);

final List<String> categoryNames = [];
final List<num> totalExpensesByCategory = [];

for (var expense in expenseStore.categoryTotalExpenses) {
  categoryNames.add(expense.categoryName);
  totalExpensesByCategory.add(expense.totalExpenses);
}

final List<Expense> expenses = expenseStore.expenses;
final List<Category> categories = categoryStore.categories;

List<String> getExpDescs(num index) {
  List<String> descs = [];
  for (var expense in expenses) {
    if (expense.categoryId == index) {
      descs.add(expense.description);
    }
  }
  return descs;
}

List<double> getExpAmounts(num index) {
  List<double> descs = [];
  for (var expense in expenses) {
    if (expense.categoryId == index) {
      descs.add(expense.amount);
    }
  }
  return descs;
}

List<String> getExpDays(num index) {
  List<String> days = [];
  for (var expense in expenses) {
    if (expense.categoryId == index) {
      var date = expense.dateCreated;
      days.add(DateFormat.d().format(date));
    }
  }
  return days;
}

   return Column (
      children: <Widget>[
        for (var i = 0; i < categoryNames.length; i++)
            Listview(
            title: categoryNames[i] + " " + totalExpensesByCategory[i].toString() + "€",
            expenses: getExpDescs(i),
            prices: getExpAmounts(i),
            days: getExpDays(i)
            )
      ]
    );
  }
}

class Listview extends StatefulWidget {
  final String title;
  final List<String> expenses;
  final List<double> prices;
  final List<String> days;
  const Listview({Key key, this.title, this.expenses, this.prices, this.days})
      : super(key: key);

  @override
  _ListStateview createState() => new _ListStateview();
}

class _ListStateview extends State<Listview> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[500],
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20),
                ),
                IconButton(
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Icon(
                          expandFlag ? Icons.expand_less : Icons.expand_more,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
              ],
            ),
          ),
          ExpandableContainer(
            expanded: expandFlag,
            tileAmount: widget.expenses.length,
            child: ListView(
              // !! Padding default value was 20, that why there was black space
              padding: EdgeInsets.only(top: 0),
              children: [
                ...widget.expenses.map((expense) {
                  num index = widget.expenses.indexOf(expense);
                  return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 25,
                              child: Text(
                                widget.days[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(width: 45),
                            Container(
                                height: 50,
                                width: 60,
                                child: Text(
                                    widget.prices[index].toString() + '€',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16))),
                            SizedBox(width: 35),
                            Container(
                                height: 50,
                                width: 135,
                                child: Text(
                                  widget.expenses[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )),
                            PopupMenuButton(
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: Text("Muokkaa kulua"),
                                      ),
                                    ],
                                initialValue: 0,
                                onSelected: (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ModifyExpense()),
                                  );
                                })
                          ]));
                }).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;
  final int tileAmount;

  ExpandableContainer({
    @required this.child,
    @required this.tileAmount,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 50.0,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(children: <Widget>[
      AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: screenWidth,
        height: expanded ? 50.0 : 0.00,
        color: Colors.white,
        child: Container(
            color: Colors.white,
            child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Päivä",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        backgroundColor: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text("Summa",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          backgroundColor: Colors.white)),
                  SizedBox(width: 25),
                  Text("Selite",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          backgroundColor: Colors.white)),
                ])),
      ),
      AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: Colors
              .white, // Black for now, trying to get rid of extra space on top of list
          curve: Curves.easeInOut,
          width: screenWidth,
          height:
              expanded ? 50.0 * this.tileAmount.toDouble() : collapsedHeight,
          child: child)
    ]);
  }
}
