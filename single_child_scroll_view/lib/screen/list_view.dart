import 'package:flutter/material.dart';
import 'package:single_child_scroll_view/const/colors.dart';
import 'package:single_child_scroll_view/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return renderContainer(
            color: RainbowColors[index % RainbowColors.length],
            index: index,
          );
        },
      ),
    );
  }

  Widget renderDefault() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
              color: RainbowColors[e % RainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
  }) {
    print('@$index');

    return Container(
      height: 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
