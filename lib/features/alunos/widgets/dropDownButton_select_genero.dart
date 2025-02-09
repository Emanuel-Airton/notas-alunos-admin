import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/provider/alunos_provider.dart';
import 'package:provider/provider.dart';

class DropdownbuttonSelectGenero extends StatefulWidget {
  const DropdownbuttonSelectGenero({super.key});

  @override
  State<DropdownbuttonSelectGenero> createState() =>
      _DropdownbuttonSelectGeneroState();
}

class _DropdownbuttonSelectGeneroState
    extends State<DropdownbuttonSelectGenero> {
  List<String> itens = ['Masculino', 'Feminino'];
  String? valor;
  @override
  Widget build(BuildContext context) {
    final alunosProvider = Provider.of<AlunosProvider>(context);
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null) {
          return 'Selecione o genero do aluno';
        } else {
          return null;
        }
      },
      value: valor,
      borderRadius: BorderRadius.circular(15),
      decoration: InputDecoration(
        hintText: 'Genero do aluno',
      ),
      items: itens.map((item) {
        return DropdownMenuItem(value: item, child: Text(item.toString()));
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          valor = value;
          alunosProvider.setAlunoGenero(valor!);
        });
      },
    );
  }
}
