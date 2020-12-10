import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:provider/provider.dart';

class TimeFilter extends StatefulWidget {
  const TimeFilter({Key key}) : super(key: key);

  @override
  _TimeFilterState createState() => _TimeFilterState();
}

class _TimeFilterState extends State<TimeFilter> {
  @override
  void didChangeDependencies() async {
    print("test _TimeFilterState");
    final expenseStore = Provider.of<ExpenseStore>(context);
    await expenseStore.fetchAvailableYears();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);

    return Container(
      height: 70,
      color: Colors.orange[50],
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Observer(
            builder: (_) => DropdownButton<Month>(
                value: expenseStore.selectedMonth,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (Month newMonth) {
                  expenseStore.setMonth(newMonth);
                },
                items: expenseStore.availableMonths
                    .map<DropdownMenuItem<Month>>((Month value) {
                  return DropdownMenuItem<Month>(
                    value: value,
                    child: Text(getMonthName(value)),
                  );
                }).toList())),
        Observer(
            builder: (_) => DropdownButton<num>(
                  value: expenseStore.selectedYear,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (num newValue) {
                    expenseStore.setYear(newValue);
                  },
                  items: expenseStore.availableYears
                      .map<DropdownMenuItem<num>>((num value) {
                    return DropdownMenuItem<num>(
                        value: value,
                        child: Text(
                          value.toString(),
                        ));
                  }).toList(),
                ))
      ]),
    );
  }
}
