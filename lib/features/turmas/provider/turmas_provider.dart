import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';

class TurmasProvider extends ChangeNotifier {
  Turmas turmas = Turmas();
  Map _alunos = {};
  Map<String, dynamic> _turmaData = {"quantidade": 0, "alunos": []};
  //late Map<String, dynamic> _turmaData;

  String get nomeTurma => turmas.nomeTuma;
  String get turno => turmas.turno;
  setTurmaNome(String nomeTurma) {
    turmas.nomeTuma = nomeTurma;
    notifyListeners();
  }

  setTurmaTurno(String turno) {
    turmas.turno = turno;
    notifyListeners();
  }

  get turmaData => _turmaData;

  set turmaData(value) => _turmaData = value;

  Map get alunos => _alunos;

  set alunos(Map value) => _alunos = value;
  bool _isloading = false;

  get isloading => _isloading;

  set isloading(value) => _isloading = value;

  final PageController _pageController = PageController();
  get pageController => _pageController;

  void navigateToPage(int index) {
    if ((index - _pageController.page!).abs() > 1) {
      _pageController.jumpToPage(index);
    } else {
      pageAnimation(index);
      notifyListeners();
    }
  }

  void pageAnimation(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  listAlunos(Map mapListAlunos) async {
    _isloading = true;
    notifyListeners();
    try {
      if (mapListAlunos.isNotEmpty) {
        alunos = mapListAlunos;
        _isloading = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('erro :$e');
    }
  }

  //recebe o map contendo as informações da turma como a lista de alunos
  setStreamAlunos(Map<String, dynamic> mapTurma) {
    _isloading = true;
    notifyListeners();
    if (mapTurma.isNotEmpty) {
      _turmaData = mapTurma;
      debugPrint(turmaData.toString());
      _isloading = false;
      notifyListeners();
    }
  }
}
