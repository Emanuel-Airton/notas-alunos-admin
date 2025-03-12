import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';

class Disciplina {
  late String _nomeDisciplina;
  late String _turno;
  late List<ModelTurmas> turmas;

  get nomeDisciplina => _nomeDisciplina;

  set nomeDisciplina(value) => _nomeDisciplina = value;

  get turno => _turno;

  set turno(value) => _turno = value;

  Map<String, dynamic> toMap(List<ModelTurmas> turmas) {
    return {
      "nome": nomeDisciplina,
      "turmas": turmas
          .map((turma) => {"nomeTurma": turma.nomeTuma, "turno": turma.turno}),
    };
  }
}
