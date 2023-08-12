import 'package:flutter/material.dart';
import 'package:single_child_scroll_view/const/colors.dart';
import 'package:single_child_scroll_view/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);

  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          return renderContainer(
            color: RainbowColors[index % RainbowColors.length],
            index: index,
          );
        },
      ),
    );
  }

  Widget renderGridBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return renderContainer(
          color: RainbowColors[index % RainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderGridCount() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
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
