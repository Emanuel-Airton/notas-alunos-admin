import 'package:flutter/material.dart';

class TextfieldNomeProfessor extends StatelessWidget {
  final TextEditingController controllerNome;

  const TextfieldNomeProfessor({super.key, required this.controllerNome});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controllerNome,
      validator: (value) {
        if (value!.isEmpty) {
          return 'insira o nome do professor';
        } else {
          return null;
        }
      },
      maxLength: 50,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Nome do professor'),
    );
  }
}
