import 'package:notas_alunos_windows/models/model_notas.dart';

class Alunos {
  late String _nomeAluno;
  late String documentAluno;
  late List<Notas>? _notas;
  late String _telefone;

  String get telefone => _telefone;

  set telefone(String value) => _telefone = value;

  String get nomeAluno => _nomeAluno;

  set nomeAluno(String value) => _nomeAluno = value;

  get notas => _notas;

  set notas(value) => _notas = value;

  Alunos({nome, required this.documentAluno, notasAluno}) {
    nome = nomeAluno;
    notas = notas;
  }
  Alunos.semdados();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> notasPorTrimestre = {};

    for (var nota in notas!) {
      notasPorTrimestre = {
        "disciplina": nota.disciplina.nomeDisciplina,
        "nota": nota.nota,
      };
    }
    return notasPorTrimestre;
  }
}
