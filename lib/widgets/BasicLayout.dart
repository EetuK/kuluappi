import 'package:flutter/material.dart';
import 'package:kuluappi/stores/category_store.dart';
import 'package:kuluappi/views/add_expense/add_expense_view.dart';
import 'package:kuluappi/views/settings/settings_view.dart';
import 'package:provider/provider.dart';
import 'TopBar.dart';

class BasicLayout extends StatelessWidget {
  const BasicLayout(
      {this.isMenuButtonShown = true,
      this.isHoverButtonShown = false,
      this.body});

  final bool isMenuButtonShown;
  final bool isHoverButtonShown;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    final categoryStore = Provider.of<CategoryStore>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Builder(
          builder: (context) => TopBar(
            onMenuPress: () => Scaffold.of(context).openEndDrawer(),
            isMenuButtonShown: isMenuButtonShown,
          ),
        ),
      ),
      body: this.body,
      backgroundColor: Colors.orange[100],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await categoryStore.fetchCategories();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpense()),
          );
        },
        label: Text('ADD EXPENSE'),
        backgroundColor: Colors.red[400],
      ),
      endDrawer: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[
            Container(
              child: Text(
                "Menu",
                textScaleFactor: 2,
              ),
              margin: EdgeInsets.only(top: statusBarHeight),
              padding: EdgeInsets.all(15),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsView()),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
