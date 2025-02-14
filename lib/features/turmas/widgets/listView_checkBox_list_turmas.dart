import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/disciplinas/provider/disciplina_provider.dart';
import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

class ListViewCheckBoxTurmasMatutino extends StatefulWidget {
  const ListViewCheckBoxTurmasMatutino({super.key});

  @override
  State<ListViewCheckBoxTurmasMatutino> createState() =>
      _CheckboxListTurmasState();
}

class _CheckboxListTurmasState extends State<ListViewCheckBoxTurmasMatutino> {
  @override
  Widget build(BuildContext context) {
    final turmasProvider = Provider.of<TurmasProvider>(context);
    final disciplinaProvider = Provider.of<DisciplinaProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: turmasProvider.turmasMatutino.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Checkbox(
              value: turmasProvider.listCheckBoxMatutino[index],
              onChanged: (value) {
                setState(() {
                  turmasProvider.listCheckBoxMatutino[index] = value!;
                });
                if (turmasProvider.listCheckBoxMatutino[index] == true) {
                  Turmas t = Turmas.semdados();
                  t.nomeTuma = turmasProvider.turmasMatutino[index]['nome'];
                  t.turno = turmasProvider.turmasMatutino[index]['turno'];
                  Map<String, dynamic> map = {
                    'nome': t.nomeTuma,
                    'turno': t.turno
                  };
                  disciplinaProvider.setTurmas(map);
                }
              }),
          title: Text(turmasProvider.turmasMatutino[index]['nome'].toString()),
        );
      },
    );
  }
}
