import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../timeentry/time_entry_form_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _MyCalendarScreen();
}

class _MyCalendarScreen extends State<CalendarScreen> {
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Consumer<TimeEntryModel>(
        builder: (context, model, child) {
          return SfCalendar(
            view: CalendarView.day,
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
            showNavigationArrow: true,
            showCurrentTimeIndicator: true,
            allowAppointmentResize: true,
            allowDragAndDrop: true,
            firstDayOfWeek: 1,
            monthViewSettings: MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
            controller: _calendarController,
            dataSource: _TimeEntryDataSource(model.entities),
            onLongPress: _handleCalendarLongPress,
            onTap: _handleCalendarTap,
          );
        },
      ),
    );
  }

  // Handle long press to create a new time entry
  void _handleCalendarLongPress(CalendarLongPressDetails details) {
    if (details.targetElement == CalendarElement.calendarCell) {
      TimeEntryBuilder builder = TimeEntryBuilder();
      builder.startedOn = details.date!;

      showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        context: context,
        builder: (context) => TimeEntryFormScreen(
          entry: builder,
        ),
      );
    }
  }

  void _handleCalendarTap(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final TimeEntry timeEntry = (details.appointments![0] as TimeEntry);

      showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        context: context,
        builder: (context) => TimeEntryFormScreen(
          entry: timeEntry.toBuilder(),
        ),
      );
    }
  }
}

class _TimeEntryDataSource extends CalendarDataSource<TimeEntry> {
  _TimeEntryDataSource(List<TimeEntry> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startedOn;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endedOn ?? DateTime.now();
  }

  @override
  String getSubject(int index) {
    return appointments![index].description;
  }

  @override
  Color getColor(int index) {
    // You could set colors based on customer or service type
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];

    final charCode = appointments![index].description.isNotEmpty
        ? appointments![index].description.codeUnitAt(0)
        : 0;

    return colors[charCode % colors.length];
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
