import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/disciplinas/models/model_disciplina.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';

class DisciplinaProvider extends ChangeNotifier {
  ModelDisciplina disciplina = ModelDisciplina();
  List<Map<String, dynamic>> listaTurmas = [];
  bool disciplinaSelecionada = false;

  setNomeDisciplina(String nomeDisciplina) {
    disciplinaSelecionada = false;
    notifyListeners();
    if (nomeDisciplina.isNotEmpty) {
      disciplina.nomeDisciplina = nomeDisciplina;
      disciplinaSelecionada = true;
      notifyListeners();
    }
  }

  setTurmas(Map<String, dynamic> map) {
    listaTurmas.add(map);
    disciplina.listTurmas = listaTurmas;
    Map mapa = disciplina.toMapAdicionaTurmas();
    // debugPrint(mapa.toString());
    notifyListeners();
  }

  adicionarDisciplina(ModelProfessor modelProfessor) {
    Map map = disciplina.toMap();
    //  debugPrint(map.toString());
    notifyListeners();
  }

  salvarDisciplinaFirestore(ModelProfessor modelProfessor) async {
    DatabaseProfessor professor = DatabaseProfessor();
    //Map map = disciplina.toMapAdicionaTurmas();
    //debugPrint(map.toString());
    await professor.inserirDisciplinasProfessor(modelProfessor, disciplina);
    notifyListeners();
  }

  limparDisciplinaProvider() {
    listaTurmas.clear();
    disciplina.nomeDisciplina = '';
    disciplinaSelecionada = false;
    notifyListeners();
  }
}
