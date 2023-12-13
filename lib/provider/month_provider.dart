import 'package:contact_diary_ios_android/model/date_model.dart';
import 'package:contact_diary_ios_android/model/month_model.dart';
import 'package:contact_diary_ios_android/model/time_model.dart';
import 'package:flutter/material.dart';

class MonthProvider extends ChangeNotifier {
  DateModel dateModel = DateModel(date: '');
  TimeModel timeModel = TimeModel(timeOfDay: '');
  List<MonthModel> monthName = [
    MonthModel(month: 'Jan'),
    MonthModel(month: 'Feb'),
    MonthModel(month: 'Mar'),
    MonthModel(month: 'Apr'),
    MonthModel(month: 'May'),
    MonthModel(month: 'Jun'),
    MonthModel(month: 'Jul'),
    MonthModel(month: 'Aug'),
    MonthModel(month: 'Sep'),
    MonthModel(month: 'Oct'),
    MonthModel(month: 'Nav'),
    MonthModel(month: 'Dec'),
  ];

  DateTime dateTime = DateTime.now();
  bool dateChecked = false;

  void dateFind1(context) async {
    dateChecked = true;
    DateTime? res = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    dateModel.date =
        '${res!.day},${monthName.elementAt(res.month - 1).month} ${res.year}';
    notifyListeners();
  }

  String dateFind() {
    return '${dateTime.day},${monthName.elementAt(dateTime.month - 1).month} ${dateTime.year}';
  }

  TimeOfDay timeOfDay = TimeOfDay.now();
  bool timeChecked = false;
  void timeFind1(context) async {
    timeChecked = true;
    TimeOfDay? res = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    timeModel.timeOfDay =
        '${res!.hour % 12}:${res.minute % 60} ${(res.hour >= 12) ? 'PM' : 'AM'}';
    notifyListeners();
  }

  String timeFind() {
    return '${timeOfDay.hour % 12}:${timeOfDay.minute % 60} ${timeOfDay.period.name}';
  }
}
