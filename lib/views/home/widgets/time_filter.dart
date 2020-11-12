import 'package:flutter/material.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter();

  @override
  Widget build(BuildContext context) {
    const bool noExpenses = true;

    return Container(
      height: 70,
      color: Colors.orange[50],
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // Container(
        //   child: TextField(
        //     obscureText: true,
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       labelText: 'Password',
        //     ),
        //   ),
        // ),
        // Container(
        //     child: TextField(
        //   obscureText: true,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Password',
        //   ),
        // ))
      ]),
    );
  }
}
