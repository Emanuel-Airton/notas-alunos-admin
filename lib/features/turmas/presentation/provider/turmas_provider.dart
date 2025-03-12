import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/data/database/turmas_firestore_repository.dart';
import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';

import 'package:notas_alunos_windows/features/turmas/domain/usecases/turmas_firestore_usecase.dart';
import 'package:notas_alunos_windows/features/turmas/services/turmas_services.dart';

class TurmasProvider extends ChangeNotifier {
  ModelTurmas turmas = ModelTurmas.semdados();
  TurmasServices turmasServices = TurmasServices();
  Map<String, dynamic> _turmaData = {"quantidade": 0, "alunos": []};
  List<ModelTurmas> listaTurmas = [];
  List<ModelTurmas> turmasMatutino = [];
  List<ModelTurmas> turmasVespertino = [];
  List<bool> listCheckBoxMatutino = [];
  List<bool> listCheckBoxVespertino = [];
  String get nomeTurma => turmas.nomeTuma!;
  String get turno => turmas.turno!;

  TurmasFirestoreRepository turmasFirestoreRepository =
      TurmasFirestoreRepository();

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

  bool _isloading = false;

  get isloading => _isloading;

  set isloading(value) => _isloading = value;

  final PageController _pageController = PageController();
  get pageController => _pageController;

  void navigateToPage(int index) {
    pageAnimation(index);
    notifyListeners();
    /* if ((index - _pageController.page!).abs() > 1) {
      _pageController.jumpToPage(index);
    } else {
      pageAnimation(index);
      notifyListeners();
    }*/
  }

  //configura a animação da pagina
  void pageAnimation(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  //recebe o map contendo as informações da turma como a lista de alunos
  setStreamAlunos(Map<String, dynamic> mapTurma) {
    _isloading = true;
    notifyListeners();
    if (mapTurma.isNotEmpty) {
      _turmaData = mapTurma;
      //  debugPrint(turmaData.toString());
      _isloading = false;
      notifyListeners();
    }
  }

  /*listaTurmasFirestore(List<Map<String, String>> listaTurmasRecebida) {
    _isloading = true;
    notifyListeners();

    listaTurmas = listaTurmasRecebida;
    debugPrint(listaTurmas.toString());
    _isloading = false;
    notifyListeners();
  }*/

  listaTurmasFirestore2() async {
    TurmasFirestoreUsecase turmasFirestoreUsecase =
        TurmasFirestoreUsecase(turmasFirestoreRepository);
    _isloading = true;
    notifyListeners();

    listaTurmas = await turmasFirestoreUsecase.listTurmas();
    _isloading = false;

    notifyListeners();
  }

  deletarTurma(String doc) async {
    TurmasFirestoreUsecase turmasFirestoreUsecase =
        TurmasFirestoreUsecase(turmasFirestoreRepository);
    turmasFirestoreUsecase.deletarTurma(doc);
    listaTurmasFirestore2();
    notifyListeners();
  }

  setListaMatutino(List<ModelTurmas> list) {
    turmasMatutino = list;
    notifyListeners();
  }

  setTurmasVespertino(List<ModelTurmas> list) {
    turmasVespertino = list;
    notifyListeners();
  }

  setCheckBoxTurmasMatutino(List<bool> listaRecebida) {
    listCheckBoxMatutino = listaRecebida;
    notifyListeners();
  }

  setCheckBoxTurmasVespertino(List<bool> listaRecebida) {
    listCheckBoxVespertino = listaRecebida;
    notifyListeners();
  }

  limparListaTurmas() {
    List<bool> listMatutinoReserva = [];
    List<bool> listvespertinoReserva = [];

    for (var item in listCheckBoxMatutino) {
      item = false;
      listMatutinoReserva.add(item);
    }
    listCheckBoxMatutino = listMatutinoReserva;

    for (var item in listCheckBoxVespertino) {
      item = false;
      listvespertinoReserva.add(item);
    }
    listCheckBoxVespertino = listvespertinoReserva;
    notifyListeners();
  }
}
