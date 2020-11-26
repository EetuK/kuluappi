import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:provider/provider.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter();

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);

    return Container(
      height: 70,
      color: Colors.orange[50],
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Observer(
            builder: (_) => DropdownButton<Month>(
                value: expenseStore.month,
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
                items: [...getMonthNumbers()]
                    .map<DropdownMenuItem<Month>>((Month value) {
                  return DropdownMenuItem<Month>(
                    value: value,
                    child: Text(getMonthName(value)),
                  );
                }).toList())),
        DropdownButton<num>(
          value: 2020,
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
          items: <num>[2020].map<DropdownMenuItem<num>>((num value) {
            return DropdownMenuItem<num>(
                value: value,
                child: Text(
                  value.toString(),
                ));
          }).toList(),
        )
      ]),
    );
  }
}
