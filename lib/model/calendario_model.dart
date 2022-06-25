// ignore_for_file: deprecated_member_use
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CalendarDayModel {
  String? dayLetter;
  int? dayNumber;
  int? month;
  int? year;
  bool? isChecked;

  CalendarDayModel(
      {this.dayLetter, this.dayNumber, this.year, this.month, this.isChecked});

  var days = {
    "Sun": "Dom",
    "Mon": "Seg",
    "Tue": "Ter",
    "Wed": "Qua",
    "Thu": "Qui",
    "Fri": "Sex",
    "Sat": "Sáb"
  };

  //----------------| get current 7 days |----------------------
  List<CalendarDayModel> getCurrentDays() {
    final List<CalendarDayModel> daysList = [];
    DateTime currentTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      daysList.add(CalendarDayModel(
          dayLetter: days[DateFormat.E().format(currentTime).toString()],
          dayNumber: currentTime.day,
          month: currentTime.month,
          year: currentTime.year,
          isChecked: false));
      currentTime = currentTime.add(Duration(days: 1));
    }
    daysList[0].isChecked = true;
    return daysList;
  }
  //============================================================
}
