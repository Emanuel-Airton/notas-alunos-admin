/*class Turmas {
  String _nomeTuma = '';
  String _turno = '';
  List<String> _alunos = [];
  int _quantidade = 0;

  get quantidade => _quantidade;

  set quantidade(value) => _quantidade = value;

  get nomeTuma => _nomeTuma;

  set nomeTuma(value) => _nomeTuma = value;

  get turno => _turno;

  set turno(value) => _turno = value;

  get alunos => _alunos;

  set alunos(value) => _alunos = value;

  Turmas({required nomeTuma, required turno});
  Turmas.semdados();
}*/
class Turmas {
  String? nomeTuma;
  String? turno;
  List<String>? alunos;
  int? quantidade;

  Turmas({required nomeTuma, required turno});
  Turmas.semdados();
}
