import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/disciplinas/provider/disciplina_provider.dart';
import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

class ListviewCheckboxTurmasVespertino extends StatefulWidget {
  const ListviewCheckboxTurmasVespertino({super.key});

  @override
  State<ListviewCheckboxTurmasVespertino> createState() =>
      _ListviewCheckboxTurmasVespertinoState();
}

class _ListviewCheckboxTurmasVespertinoState
    extends State<ListviewCheckboxTurmasVespertino> {
  @override
  Widget build(BuildContext context) {
    final turmasProvider = Provider.of<TurmasProvider>(context);
    final disciplinaProvider = Provider.of<DisciplinaProvider>(context);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: turmasProvider.turmasVespertino.length,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Checkbox(
              value: turmasProvider.listCheckBoxVespertino[index],
              onChanged: (value) {
                setState(() {
                  turmasProvider.listCheckBoxVespertino[index] = value!;
                });
                if (turmasProvider.listCheckBoxMatutino[index] == true) {
                  Turmas t = Turmas.semdados();
                  t.nomeTuma = turmasProvider.turmasVespertino[index]['nome'];
                  t.turno = turmasProvider.turmasVespertino[index]['turno'];
                  Map<String, dynamic> map = {
                    'nome': t.nomeTuma,
                    'turno': t.turno
                  };
                  disciplinaProvider.setTurmas(map);
                }
              }),
          title:
              Text(turmasProvider.turmasVespertino[index]['nome'].toString()),
        );
      },
    );
  }
}
