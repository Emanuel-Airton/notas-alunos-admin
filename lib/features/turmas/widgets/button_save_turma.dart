import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/data/database/turmas_firestore_repository.dart';

import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

class ButtonSaveTurma extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  final TurmasFirestoreRepository _turmasFirestore =
      TurmasFirestoreRepository();
  ButtonSaveTurma(
      {super.key, required this.formKey, required this.textEditingController});
  final ModelTurmas _turmas = ModelTurmas.semdados();
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
