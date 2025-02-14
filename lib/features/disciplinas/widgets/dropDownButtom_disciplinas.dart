import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/disciplinas/provider/disciplina_provider.dart';
import 'package:provider/provider.dart';

class DropdownButtonDisciplinas extends StatefulWidget {
  const DropdownButtonDisciplinas({super.key});

  @override
  State<DropdownButtonDisciplinas> createState() =>
      _DropdownButtonDisciplinasState();
}

class _DropdownButtonDisciplinasState extends State<DropdownButtonDisciplinas> {
  final List<String> itens = [
    'Arte',
    'Inglês',
    'Geografia',
    'História',
    'Português',
    'Matemática',
    'Ciências',
    'Educação física',
    'Ensino religioso'
  ];

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final disciplinaProvider = Provider.of<DisciplinaProvider>(context);
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Selecione a disciplina',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      items: itens.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      value: _selectedValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
          disciplinaProvider.setNomeDisciplina(_selectedValue!);
        });
      },
    );
  }
}
