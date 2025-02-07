import 'package:notas_alunos_windows/models/model_disciplina.dart';

class Notas {
  late double _nota;
  late String _trimestre;
  late Disciplina _disciplina;
  late double mediaFinal;

  get getMediaFinal => mediaFinal;

  set setMediaFinal(mediaFinal) => this.mediaFinal = mediaFinal;

  Disciplina get disciplina => _disciplina;

  set disciplina(Disciplina value) => _disciplina = value;

  get nota => _nota;

  set nota(value) => _nota = double.parse(value.toStringAsFixed(1));

  get trimestre => _trimestre;

  set trimestre(value) => _trimestre = value;

/*  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "Média final": [
        {disciplina.nomeDisciplina: mediaFinal}
      ]
    };
    return map;
  }*/
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {disciplina.nomeDisciplina: mediaFinal};

    return map;
  }
}
