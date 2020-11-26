import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:provider/provider.dart';

class ContentToggle extends StatefulWidget {
  final Widget listWidget;
  final Widget chartWidget;

  ContentToggle(
      {Key key, @required this.listWidget, @required this.chartWidget})
      : super(key: key);
  @override
  _ContentToggleState createState() => _ContentToggleState();
}

class _ContentToggleState extends State<ContentToggle> {
  bool _isListView = false;

  void _toggleListView() {
    setState(() {
      _isListView = !this._isListView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);
    return Container(
      color: Colors.orange[50],
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(
                      builder: (_) => Text(
                            getMonthName(expenseStore.month),
                            textScaleFactor: 2,
                          )),
                  IconButton(
                    icon: Icon(_isListView ? Icons.bar_chart : Icons.list),
                    tooltip: 'List view',
                    onPressed: () => {_toggleListView()},
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _isListView ? widget.listWidget : widget.chartWidget,
            ),
          )
        ],
      ),
    );
  }
}
