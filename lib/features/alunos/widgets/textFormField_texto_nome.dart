import 'package:flutter/material.dart';

class TextformfieldTextoNome extends StatelessWidget {
  final TextEditingController controllerNome;
  const TextformfieldTextoNome({super.key, required this.controllerNome});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controllerNome,
      validator: (value) {
        if (value!.isEmpty) {
          return 'insira o nome do aluno';
        } else {
          return null;
        }
      },
      maxLength: 50,
      decoration:
          InputDecoration(border: InputBorder.none, hintText: 'Nome do aluno'),
    );
  }
}
