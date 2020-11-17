import 'package:flutter/material.dart';

class TimeFilter extends StatelessWidget {
  const TimeFilter();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.orange[50],
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        DropdownButton<String>(
            value: "Tammikuu",
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (String newValue) {},
            items: <String>[
              'Tammikuu',
              'Helmikuu',
              'Maaliskuu',
              'Huhtikuu',
              'Toukokuu',
              'Kesäkuu',
              'Heinäkuu',
              'Elokuu',
              'Syyskuu',
              'Lokakuu',
              'Marraskuu',
              'Joulukuu'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
        DropdownButton<String>(
          value: "2020",
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black, fontSize: 18),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String newValue) {},
          items: <String>['2019', '2020']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ]),
    );
  }
}
