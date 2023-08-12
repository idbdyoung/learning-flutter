import 'package:flutter/material.dart';
import 'package:single_child_scroll_view/const/colors.dart';
import 'package:single_child_scroll_view/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
        child: Column(
            children: numbers
                .map(
                  (e) =>
                  renderContainer(
                    color: RainbowColors[e % RainbowColors.length],
                  ),
            )
                .toList()),
      ),
    );
  }

  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: RainbowColors.map(
              (e) => renderContainer(color: e),
        ).toList(),
      ),
    );
  }

  Widget renderScrollAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(children: [renderContainer(color: Colors.black)]),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }
    return Container(
      height: 300,
      color: color,
    );
  }
}
