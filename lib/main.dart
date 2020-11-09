import 'package:flutter/material.dart';
import 'package:kuluappi/views/home/home_view.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(KuluAppi());

class KuluAppi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<ExpenseStore>(create: (_) => ExpenseStore())],
        child: MaterialApp(
          title: 'Mob',
          home: const HomeView(),
        ));
  }
}
