import 'package:flutter/material.dart';

class TextformfieldTextoTelefone extends StatelessWidget {
  final TextEditingController controllerTelefone;
  const TextformfieldTextoTelefone(
      {super.key, required this.controllerTelefone});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerTelefone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'insira o telefone do aluno';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      maxLength: 11,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Telefone para contato'),
    );
  }
}
