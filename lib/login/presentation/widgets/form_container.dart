import 'package:flutter/material.dart';
import 'package:flutter_app_animation/login/presentation/widgets/input_field.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            InputField(Icons.person, "Usuario", false),
            InputField(Icons.lock, "Senha", true),
          ],
        ),
      ),
    );
  }
}
