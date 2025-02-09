import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/database/database_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';

class AlunosProvider extends ChangeNotifier {
  Alunos alunos = Alunos.semdados();
  DatabaseAluno databaseAluno = DatabaseAluno();
  setAlunoPossuiDeficiencia(bool valor) {
    alunos.possuiDeficiencia = valor;
    notifyListeners();
  }

  setAlunoGenero(String valor) {
    alunos.setGenero = valor;
    notifyListeners();
  }

  setAlunoNome(String valor) {
    alunos.nomeAluno = valor;
    notifyListeners();
  }

  setAlunoTelefone(String valor) {
    alunos.telefone = valor;
    notifyListeners();
  }

  salvarDadosAlunosFirestore(String nomeTurma) async {
    await databaseAluno.salvarNovoAluno(nomeTurma, alunos);
    limparDados();
  }

  limparDados() {
    alunos.nomeAluno = '';
    alunos.telefone = '';
    alunos.setGenero = '';
    alunos.possuiDeficiencia = false;
    notifyListeners();
  }
}
