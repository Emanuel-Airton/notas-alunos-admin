import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';

class ModelDisciplina {
  late String _nomeDisciplina;
  late List<Turmas> _turmas;
  late List<Map> listTurmas;

  List<Turmas> get turmas => _turmas;

  set turmas(List<Turmas> value) => _turmas = value;

  get nomeDisciplina => _nomeDisciplina;

  set nomeDisciplina(value) => _nomeDisciplina = value;

  toMap() {
    return {
      'disciplina': _nomeDisciplina,
      'turmas': _turmas.map((t) => {'nomeTurma': t.nomeTuma, 'turno': t.turno})
    };
  }

  toMapAdicionaTurmas() {
    return [
      {
        'nome': _nomeDisciplina,
        'turmas':
            listTurmas.map((t) => {'nomeTurma': t['nome'], 'turno': t['turno']})
      }
    ];
  }
}
