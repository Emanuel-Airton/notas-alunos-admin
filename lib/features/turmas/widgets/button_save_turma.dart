import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/database/database_turmas.dart';
import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

class ButtonSaveTurma extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  final TurmasFirestore _turmasFirestore = TurmasFirestore();
  ButtonSaveTurma(
      {super.key, required this.formKey, required this.textEditingController});
  final Turmas _turmas = Turmas();
  @override
  Widget build(BuildContext context) {
    final turmaProvider = Provider.of<TurmasProvider>(context);
    return ElevatedButton(
        style: ButtonStyle(),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            try {
              _turmas.nomeTuma = textEditingController.text;
              _turmas.turno = turmaProvider.turno;
              String mensagem = await _turmasFirestore.salvarTurma(_turmas);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                child: Text(mensagem),
              )));
            } catch (e) {
              debugPrint(e.toString());
            }
          }
        },
        child: Text('Salvar turma'));
  }
}
