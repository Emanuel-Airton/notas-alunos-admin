class ModelTurmas {
  String? nomeTuma;
  String? turno;
  String? document;
  List<String>? alunos;
  int? quantidade;

  ModelTurmas(
      {required this.nomeTuma, required this.turno, required this.document});
  ModelTurmas.semdados();

  factory ModelTurmas.fromJson(Map<String, dynamic> json) {
    return ModelTurmas(
        nomeTuma: json['nome'],
        turno: json['turno'],
        document: json['document']);
  }
  Map<String, dynamic> toJson() {
    return {'nome': nomeTuma, 'turno': turno};
  }
}
