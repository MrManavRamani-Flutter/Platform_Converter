// Settings : ...........
import 'package:contact_diary_ios_android/provider/month_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsDesign extends StatefulWidget {
  const SettingsDesign({super.key});

  @override
  State<SettingsDesign> createState() => _SettingsDesignState();
}

class _SettingsDesignState extends State<SettingsDesign> {
  // DateTime dateTime = DateTime.now();
  // TimeOfDay timeOfDay = TimeOfDay.now();
  // late String date;
  // late String time;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   date = '${dateTime.day},${dateTime.month} ${dateTime.year}';
  //   time =
  //       '${timeOfDay.hour % 12}:${timeOfDay.minute % 60} ${timeOfDay.period.name}';
  // }

  @override
  Widget build(BuildContext context) {
    var monthProvider = Provider.of<MonthProvider>(context);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      (monthProvider.dateChecked)
                          ? monthProvider.dateFind1('')
                          : monthProvider.dateFind(),
                      // '${dateTime.day},${monthProvider.monthName.elementAt(dateTime.month - 1).month} ${dateTime.year}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 50,
                  width: double.infinity,
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () async {
                      DateTime? res = await showDatePicker(
                          context: context,
                          initialDate: monthProvider.dateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendar);
                      monthProvider.dateFind1(res);
                      // setState(() {
                      //   date = '${res?.day},${res?.month} ${res?.year}';
                      // });
                    },
                    child: const Text(
                      'Change Date',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Time',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    (monthProvider.timeChecked)
                        ? monthProvider.timeModel.timeOfDay
                        : monthProvider.timeFind(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () async {
                    TimeOfDay? res1 = await showTimePicker(
                      context: context,
                      initialTime: monthProvider.timeOfDay,
                    );
                    monthProvider.timeFind1(res1);
                    // setState(() {
                    //   time =
                    //       '${timeOfDay.hour % 12}:${timeOfDay.minute % 60} ${timeOfDay.period.name}';
                    // });
                  },
                  child: const Text(
                    'Change Time',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
