import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/database/database_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class AlertdialogDeleteAluno extends StatefulWidget {
  Alunos alunos;
  AlertdialogDeleteAluno({super.key, required this.alunos});

  @override
  State<AlertdialogDeleteAluno> createState() => _AlertdialogDeleteAlunoState();
}

class _AlertdialogDeleteAlunoState extends State<AlertdialogDeleteAluno> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('Deseja excluir esse aluno da turma?',
                style: CustomTextStyle.fontNomeAlunoTurma),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancelar')),
        Consumer<TurmasProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  try {
                    DatabaseAluno databaseAluno = DatabaseAluno();
                    databaseAluno.removerAluno(value.nomeTurma, widget.alunos);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Center(
                      child: Text('Aluno apagado com sucesso'),
                    )));
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.white),
                ));
          },
        )
      ],
    );
  }
}
