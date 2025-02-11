import 'package:flutter/material.dart';

class TextfieldSenhaProfessor extends StatelessWidget {
  final TextEditingController controllerSenha;

  const TextfieldSenhaProfessor({super.key, required this.controllerSenha});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      //obscureText: true,
      controller: controllerSenha,
      validator: (value) {
        if (value!.isEmpty) {
          return 'insira a senha do professor';
        } else {
          return null;
        }
      },
      maxLength: 50,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Senha de acesso do professor'),
    );
  }
}
