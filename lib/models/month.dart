enum Month {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December
}

// class Month {
//   num id;
//   String name;

//   Month(num id, String name) {
//     this.id = id;
//     this.name = name;
//   }
// }

List<Month> getMonthNumbers() {
  return Month.values.map((name) {
    return name;
  }).toList();
}

num getMonthNumber(Month month) {
  switch (month) {
    case Month.January:
      return 1;
    case Month.February:
      return 2;
    case Month.March:
      return 3;
    case Month.April:
      return 4;
    case Month.May:
      return 5;
    case Month.June:
      return 6;
    case Month.July:
      return 7;
    case Month.August:
      return 8;
    case Month.September:
      return 9;
    case Month.October:
      return 10;
    case Month.November:
      return 11;
    case Month.December:
      return 12;

    default:
      return null;
  }
}

String getMonthName(Month month) {
  switch (month) {
    case Month.January:
      return 'January';
    case Month.February:
      return 'February';
    case Month.March:
      return 'March';
    case Month.April:
      return 'April';
    case Month.May:
      return 'May';
    case Month.June:
      return 'June';
    case Month.July:
      return 'July';
    case Month.August:
      return 'August';
    case Month.September:
      return 'September';
    case Month.October:
      return 'October';
    case Month.November:
      return 'November';
    case Month.December:
      return 'December';

    default:
      return "Error";
  }
}
