import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttomZoomOut;

  StaggerAnimation({
    this.controller,
  })  : buttonSqueeze = Tween<double>(begin: 320.0, end: 60.0).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.0, 0.150))),
        buttomZoomOut = Tween<double>(begin: 60.0, end: 1000).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.5, 1, curve: Curves.bounceOut)));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50,
      ),
      child: InkWell(
          onTap: () {
            controller.forward();
          },
          child: Hero(
            tag: "containerFade",
            child: buttomZoomOut.value <= 70
                ? Container(
                    width: buttonSqueeze.value,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: buildButtonContent(),
                  )
                : Container(
                    width: buttomZoomOut.value,
                    height: buttomZoomOut.value,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
          )),
    );
  }

  Widget buildButtonContent() {
    if (buttonSqueeze.value > 75) {
      return Text(
        "Sign in",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
