import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:numberpicker/numberpicker.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final initaldate = DateTime.now();
  int _currentValue = 3;
  int selectedvalue = 30;
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(49.0),
            ),
            child: Row(
              children: [
                InkWell(
                    onTap: () async {
                      selectedDate = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.dark(),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: initaldate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));

                      setState(() {});
                    },
                    child: Icon(Icons.edit_calendar)),
                SizedBox(width: 65),
                Text(selectedDate.toString()),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(49.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Icon(Icons.accessible_forward),
                ),
                NumberPicker(
                  axis: Axis.horizontal,
                  minValue: 15,
                  maxValue: 200,
                  value: selectedvalue,
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
