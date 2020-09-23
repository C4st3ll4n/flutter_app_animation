import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'home_top.dart';

class HomeStaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlide;
  final Animation<double> buttomZoomOut;
  final Animation<Color> colorAnim;

  HomeStaggerAnimation({
    this.controller,
  })  : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        listSlide = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(
          controller,
        ),
        colorAnim = ColorTween(
                begin: Color.fromRGBO(247, 64, 106, 1.0),
                end: Color.fromRGBO(247, 64, 106, 0))
            .animate(
                CurvedAnimation(parent: controller, curve: Curves.decelerate)),
        buttomZoomOut = Tween<double>(begin: 60.0, end: 1000).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.5, 1, curve: Curves.bounceOut)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(children: [
      ListView(
        padding: EdgeInsets.zero,
        children: [
          HomeTop(containerGrow: containerGrow),
          AnimatedListView(
            animation: listSlide,
          )
        ],
      ),
      IgnorePointer(
        child: FadeContainer(
          fadeColor: colorAnim,
        ),
      )
    ]);
  }
}

class FadeContainer extends StatelessWidget {
  final Animation<Color> fadeColor;

  const FadeContainer({Key key, this.fadeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "containerFade",
        child: Container(
          decoration: BoxDecoration(color: fadeColor.value),
        ));
  }
}
