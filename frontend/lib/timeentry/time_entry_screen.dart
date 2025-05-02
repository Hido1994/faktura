import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/timeentry/time_entry_filter_screen.dart';
import 'package:faktura/timeentry/time_entry_form_screen.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimeEntryScreen extends StatefulWidget {
  const TimeEntryScreen({super.key});

  @override
  State<TimeEntryScreen> createState() => _TimeEntryScreenState();
}

class _TimeEntryScreenState extends State<TimeEntryScreen> {
  final CalendarController _calendarController = CalendarController();

  TimeEntryBuilder builder = TimeEntryBuilder();

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Stundentafel",
      form: TimeEntryFormScreen(
        entry: builder,
      ),
      filter: const TimeEntryFilterScreen(),
      body: Consumer<TimeEntryModel>(
        builder: (context, model, child) {
          return SfCalendar(
            view: CalendarView.day,
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
              CalendarView.schedule
            ],
            showNavigationArrow: true,
            showCurrentTimeIndicator: true,
            allowAppointmentResize: true,
            allowDragAndDrop: true,
            firstDayOfWeek: 1,
            monthViewSettings: MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
            controller: _calendarController,
            dataSource: _TimeEntryDataSource(model.calendarViewEntities),
            onViewChanged: (ViewChangedDetails details) {
              if (details.visibleDates.isNotEmpty) {
                for (final date in details.visibleDates) {
                  Provider.of<TimeEntryModel>(context, listen: false)
                      .onCalendarViewChanged(year: date.year);
                }
              }
            },
            onLongPress: (CalendarLongPressDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                TimeEntryBuilder builder = TimeEntryBuilder();
                builder.startedOn = details.date!.toUtc();
                builder.endedOn = builder.startedOn?.add(Duration(hours: 1));

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
            },
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.appointment) {
                final TimeEntry timeEntry =
                    (details.appointments![0] as TimeEntry);

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
            },
            onSelectionChanged: (CalendarSelectionDetails details) {
              builder.startedOn = details.date!.toUtc();
            },
          );
        },
      ),
    );
  }
}

class _TimeEntryDataSource extends CalendarDataSource<TimeEntry> {
  _TimeEntryDataSource(List<TimeEntry> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startedOn.toLocal();
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endedOn?.toLocal() ??
        appointments![index].startedOn.toLocal().add(Duration(hours: 1));
  }

  @override
  String getSubject(int index) {
    return '${appointments![index].description} @ ${appointments![index].customer.name}';
  }

  @override
  Color getColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];

    if (appointments![index].endedOn == null) {
      return Colors.grey;
    } else {
      return colors[0];
    }
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
