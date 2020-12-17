import 'package:flutter/material.dart';
import 'package:kuluappi/views/add_expense/widgets/SelectCategoryLayout.dart';

class ModifyExpense extends StatelessWidget {
  const ModifyExpense();

  @override
  Widget build(BuildContext context) {
    return SelectCategoryLayout(
      title: "Muokkaa kulua",
      body: Center(
        child: Text(
          'Add expense',
          textScaleFactor: 1.7,
        ),
      ),
    );
  }
}
