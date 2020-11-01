import 'package:flutter/material.dart';
import 'package:kuluappi/widgets/ModalLayout.dart';

class AddExpense extends StatelessWidget {
  const AddExpense();

  @override
  Widget build(BuildContext context) {
    return ModalLayout(
      title: "Add expense",
      body: Center(
          child: Text(
        'Add expense',
        textScaleFactor: 1.7,
      )),
    );
  }
}
