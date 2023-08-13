import 'package:flutter/material.dart';
import 'package:single_child_scroll_view/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  //최대 높이
  double get maxExtent => maxHeight;

  @override
  //최소 높이
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('customScrollview screen'),
            floating: true,
            // pinned: true,
            snap: true,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverFixedHeaderDelegate(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "신기하지",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              maxHeight: 150,
              minHeight: 75,
            ),
          ),
          renderSliverGridBuilder(),
        ],
      ),
    );
  }

  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: RainbowColors[index % RainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
    );
  }

  SliverGrid renderSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                  color: RainbowColors[e % RainbowColors.length], index: e),
            )
            .toList(),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: RainbowColors[index % RainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
    );
  }

  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map((e) => renderContainer(
                color: RainbowColors[e % RainbowColors.length], index: e))
            .toList(),
      ),
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
