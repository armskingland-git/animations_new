import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FlutterCalenda extends StatefulWidget {
  const FlutterCalenda({super.key});

  @override
  State<FlutterCalenda> createState() => _FlutterCalendaState();
}
Map<DateTime, List<_Meeting>> _dataCollection = <DateTime, List<_Meeting>>{};
class _FlutterCalendaState extends State<FlutterCalenda> {
  final GlobalKey _globalKey = GlobalKey();
  final CalendarController _calendarController = CalendarController();
  final CalendarView _view = CalendarView.month;
  final _MeetingDataSource _events = _MeetingDataSource(<_Meeting>[]);
  @override
  void initState() {
    // TODO: implement initState
    _calendarController.view = _view;
    // เพิ่มข้อมูล
    _addAppointmentDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: SfCalendar(
          controller: _calendarController,
          dataSource: _events,
          // มีลูกศรเลื่อนเดือนหรือไม่
          showNavigationArrow: true,
          // load
          loadMoreWidgetBuilder:
              (BuildContext context, LoadMoreCallback loadMoreAppointments) {
            return FutureBuilder<void>(
              future: loadMoreAppointments(),
              builder: (BuildContext context, AsyncSnapshot<void> snapShot) {
                return Container(
                    height: _calendarController.view == CalendarView.schedule
                        ? 50
                        : double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color?>(Colors.red)));
              },
            );
          },
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          timeSlotViewSettings: const TimeSlotViewSettings(
            minimumAppointmentDuration: Duration(minutes: 60),
          ),
        ),
      ),
    ));
  }
  /// Creates the required appointment details as a list.
  void _addAppointmentDetails() {
    final List<String> subjectCollection = <String>[];
    subjectCollection.add('General Meeting');
    subjectCollection.add('Plan Execution');
    subjectCollection.add('Project Plan');
    subjectCollection.add('Consulting');
    subjectCollection.add('Support');
    subjectCollection.add('Development Meeting');
    subjectCollection.add('Scrum');
    subjectCollection.add('Project Completion');
    subjectCollection.add('Release updates');
    subjectCollection.add('Performance Check');

    final List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF36B37B));
    colorCollection.add(const Color(0xFF01A1EF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));
    colorCollection.add(const Color(0xFF0A8043));

    final Random random = Random();
    _dataCollection = <DateTime, List<_Meeting>>{};
    final DateTime today = DateTime.now();
    final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: -1000));
    final DateTime rangeEndDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 1000));
    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(Duration(days: 1 + random.nextInt(2)))) {
      final DateTime date = i;
      final int count = 1 + random.nextInt(3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate =
            DateTime(date.year, date.month, date.day, 8 + random.nextInt(8));
        final int duration = random.nextInt(3);
        final _Meeting meeting = _Meeting(
            subjectCollection[random.nextInt(7)],
            startDate,
            startDate.add(Duration(hours: duration == 0 ? 1 : duration)),
            colorCollection[random.nextInt(9)],
            false);

        if (_dataCollection.containsKey(date)) {
          final List<_Meeting> meetings = _dataCollection[date]!;
          meetings.add(meeting);
          _dataCollection[date] = meetings;
        } else {
          _dataCollection[date] = <_Meeting>[meeting];
        }
      }
    }
  }
}


class _MeetingDataSource extends CalendarDataSource {
  _MeetingDataSource(this.source);

  List<_Meeting> source;

  @override
  List<dynamic> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    final List<_Meeting> meetings = <_Meeting>[];
    DateTime date = DateTime(startDate.year, startDate.month, startDate.day);
    final DateTime appEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
    while (date.isBefore(appEndDate)) {
      final List<_Meeting>? data = _dataCollection[date];
      if (data == null) {
        date = date.add(const Duration(days: 1));
        continue;
      }

      for (final _Meeting meeting in data) {
        if (appointments.contains(meeting)) {
          continue;
        }

        meetings.add(meeting);
      }
      date = date.add(const Duration(days: 1));
    }

    appointments.addAll(meetings);
    notifyListeners(CalendarDataSourceAction.add, meetings);
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class _Meeting {
  _Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
