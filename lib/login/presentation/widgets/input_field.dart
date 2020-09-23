import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icone;
  final String hint;
  final bool obscure;

  InputField(this.icone, this.hint, this.obscure);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icone,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white, fontSize: 15),
          contentPadding:
              EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 5),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24, width: 0.5))),
    );
  }
}
