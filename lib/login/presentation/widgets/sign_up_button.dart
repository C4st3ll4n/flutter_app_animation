import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  SignUpButton({Key key}) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        "Não possui uma conta ? Cadastre-se",
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 12,
        ),
      ),
      padding: EdgeInsets.only(top: 160),
    );
  }
}
