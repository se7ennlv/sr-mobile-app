class PresentService {
  static var now = new DateTime.now().toString();

  static int get day {
    return DateTime.parse(now).day;
  }

  static int get month {
    return DateTime.parse(now).month;
  }

  static int get year {
    return DateTime.parse(now).year;
  }
}
