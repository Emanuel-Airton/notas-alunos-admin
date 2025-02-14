import 'package:notas_alunos_windows/models/model_disciplina.dart';

class ModelProfessor {
  late String _nomeProfessor;
  late String _emailProfessor;
  late String _idProfessor;
  late String _senha;
  //late List<Disciplina> disciplina;
  late List disciplina;

  String get senha => _senha;

  set senha(String value) => _senha = value;

  String get idProfessor => _idProfessor;

  set idProfessor(String value) => _idProfessor = value;

  get nomeProfessor => _nomeProfessor;

  set nomeProfessor(value) => _nomeProfessor = value;

  get emailProfessor => _emailProfessor;

  set emailProfessor(value) => _emailProfessor = value;

  Map<String, dynamic> professorToMap() {
    return {'nome': _nomeProfessor, 'email': _emailProfessor};
  }
}
