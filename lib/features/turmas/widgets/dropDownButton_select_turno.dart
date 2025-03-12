import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable

class DropdownbuttonSelectTurno extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const DropdownbuttonSelectTurno({super.key, required this.formkey});

  @override
  State<DropdownbuttonSelectTurno> createState() =>
      _DropdownbuttonSelectTurnoState();
}

class _DropdownbuttonSelectTurnoState extends State<DropdownbuttonSelectTurno> {
  List itens = ['matutino', 'vespertino'];
  String valor = 'matutino';
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Consumer<TurmasProvider>(
      builder: (context, valor, child) {
        return DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(15),
            decoration: InputDecoration(
              hintText: 'Selecione o turno',
              //labelText: 'Select o turno',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            value: _selectedValue,
            items: itens
                .map((element) => DropdownMenuItem<String>(
                    value: element, child: Text(element.toString())))
                .toList(),
            onChanged: (value) {
              _selectedValue = value.toString();
              valor.setTurmaTurno(value.toString());
              debugPrint('valor selecionado: $_selectedValue');
            });
      },
    );
  }
}
