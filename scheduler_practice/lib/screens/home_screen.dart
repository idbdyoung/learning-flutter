import 'package:flutter/material.dart';
import 'package:scheduler_practice/components/calender.dart';
import 'package:scheduler_practice/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: renderFloatingActionButton(),
        body: SafeArea(
          child: Column(
            children: [
              Calendar(),
              const SizedBox(height: 8.0),
              _DateBanner(),
              const SizedBox(height: 8.0),
              _ScheduleList(),
            ],
          ),
        ));
  }

  renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: PRIMARY_COLOR,
    );
  }
}

class _DateBanner extends StatelessWidget {
  const _DateBanner({super.key});

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
              '2023년 8월 7일',
              style: textStyle,
            ),
            Text(
              '0개',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('hi'),
      ],
    );
  }
}
