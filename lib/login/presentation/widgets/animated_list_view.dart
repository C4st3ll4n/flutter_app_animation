import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> animation;

  const AnimatedListView({Key key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          child: ListTile(
            title: Text("WTF"),
          ),
          margin: animation.value * 3,
        ),
        Card(
          child: ListTile(
            title: Text("WTF"),
          ),
          margin: animation.value * 2,
        ),
        Card(
          child: ListTile(
            title: Text("WTF"),
          ),
          margin: animation.value * 1,
        ),
        Card(
          child: ListTile(
            title: Text("WTF"),
          ),
          margin: animation.value * 0,
        ),
      ],
    );
  }
}
