import 'package:flutter/material.dart';
import 'package:scheduler_practice/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

final defaultBoxDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(6.0),
  color: Colors.grey[200],
);

final defaultTextStyle = TextStyle(
  color: Colors.grey[600],
  fontWeight: FontWeight.w700,
);

final headerStyle = HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.0
    )
);

final calendarStyle = CalendarStyle(
  defaultDecoration: defaultBoxDeco,
  weekendDecoration: defaultBoxDeco,
  selectedDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(6.0),
    border: Border.all(color: PRIMARY_COLOR),
  ),
  todayDecoration: BoxDecoration(
    color: PRIMARY_COLOR.withOpacity(0.8),
    borderRadius: BorderRadius.circular(6.0),
  ),
  outsideDecoration: BoxDecoration(shape: BoxShape.rectangle),
  defaultTextStyle: defaultTextStyle,
  weekendTextStyle: defaultTextStyle,
  selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
);

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: calendarStyle,
      firstDay: DateTime(2010, 1, 1),
      lastDay: DateTime(2029, 12, 31),
      focusedDay: selectedDate,
      headerStyle: headerStyle,
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime day) {
        return (selectedDate.year == day.year &&
            selectedDate.month == day.month &&
            selectedDate.day == day.day);
      },
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
    });
  }
}
