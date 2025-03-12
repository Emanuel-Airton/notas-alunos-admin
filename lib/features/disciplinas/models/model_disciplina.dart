import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';

class ModelDisciplina {
  late String _nomeDisciplina;
  late List<ModelTurmas> _turmas;
  late List<Map> listTurmas;

  List<ModelTurmas> get turmas => _turmas;

  set turmas(List<ModelTurmas> value) => _turmas = value;

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
