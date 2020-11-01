import 'package:flutter/material.dart';

class ModalLayout extends StatelessWidget {
  const ModalLayout({this.title, this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Builder(
            builder: (context) => Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          this.title,
                          textScaleFactor: 1.7,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          tooltip: 'Close',
                          onPressed: () => {Navigator.pop(context)},
                        ),
                      ]),
                  margin: EdgeInsets.only(top: statusBarHeight),
                  padding: EdgeInsets.only(left: 15),
                )),
      ),
      body: this.body,
      backgroundColor: Colors.orange[50],
    );
  }
}
