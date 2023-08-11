import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scheduler_practice/components/calender.dart';
import 'package:scheduler_practice/components/schedule_bottom_sheet.dart';
import 'package:scheduler_practice/components/schedule_card.dart';
import 'package:scheduler_practice/const/colors.dart';
import 'package:scheduler_practice/database/drift_database.dart';
import 'package:scheduler_practice/models/schedule_with_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDate: selectedDate,
              focusedDate: focusedDate,
              onDaySelected: onDaySelected,
            ),
            const SizedBox(height: 8.0),
            _DateBanner(
              selectedDate: selectedDate,
            ),
            const SizedBox(height: 8.0),
            _ScheduleList(
              selectedDate: selectedDate,
            ),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      selectedDate = selectedDay;
      focusedDate = focusedDay;
    });
  }

  renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return ScheduleBottomSheet(
              selectedDate: selectedDate,
            );
          },
        );
      },
      child: Icon(Icons.add),
      backgroundColor: PRIMARY_COLOR,
    );
  }
}

class _DateBanner extends StatelessWidget {
  final DateTime selectedDate;

  const _DateBanner({
    required this.selectedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white);

    return Container(
      color: PRIMARY_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
              style: textStyle,
            ),
            StreamBuilder<List<ScheduleWithColor>>(
              stream: GetIt.I<LocalDatabase>().watchScheduleWithColors(selectedDate),
              builder: (context, snapshot) {
                int count = 0;

                if (snapshot.hasData) {
                  count = snapshot.data!.length;
                }

                return Text(
                  count.toString(),
                  style: textStyle,
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  final DateTime selectedDate;

  const _ScheduleList({
    required this.selectedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder<List<ScheduleWithColor>>(
          stream:
              GetIt.I<LocalDatabase>().watchScheduleWithColors(selectedDate),
          builder: (context, snapshot) {
            // 로딩 인디케이터
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // 스케줄이 없을 시
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text('스케줄이 없습니다.'),
              );
            }

            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.0,
                );
              },
              itemBuilder: (context, index) {
                final scheduleWithColor = snapshot.data![index];

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return ScheduleBottomSheet(
                          selectedDate: selectedDate,
                          scheduleId: scheduleWithColor.schedule.id,
                        );
                      },
                    );
                  },
                  child: Dismissible(
                    key: ObjectKey(scheduleWithColor.schedule.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (DismissDirection direction) {
                      GetIt.I<LocalDatabase>().removeSchedule(scheduleWithColor.schedule.id);
                    },
                    child: ScheduleCard(
                      startTime: scheduleWithColor.schedule.startTime,
                      endTime: scheduleWithColor.schedule.endTime,
                      content: scheduleWithColor.schedule.content,
                      color: Color(
                        int.parse(
                          'FF${scheduleWithColor.categoryColor.hexCode}',
                          radix: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
