import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int _index = 0;
  final List<String> _categories = ["Trabalho", "Estudos", "Casa"];

  void _foward() {
    setState(() {
      _index < (_categories.length - 1) ? _index++ : null;
    });
  }

  void _backard() {
    setState(() {
      _index > 0 ? _index-- : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _backard();
          },
          color: Colors.white,
        ),
        Text(
          _categories[_index].toUpperCase(),
          style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.2,
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              _foward();
            }),
      ],
    );
  }
}
