import 'package:flutter/material.dart';
import 'package:kuluappi/views/home/home_view.dart';

void main() => runApp(KuluAppi());

class KuluAppi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mob',
      home: const HomeView(),
    );
  }
}
