import 'package:flutter/material.dart';

class TextfieldEmailProfessor extends StatelessWidget {
  final TextEditingController controllerEmail;

  const TextfieldEmailProfessor({super.key, required this.controllerEmail});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      controller: controllerEmail,
      validator: (value) {
        if (value!.isEmpty) {
          return 'insira o email do professor';
        } else {
          return null;
        }
      },
      maxLength: 50,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'email do professor'),
    );
  }
}
