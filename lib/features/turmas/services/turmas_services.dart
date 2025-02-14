import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';

class TurmasServices {
  separarTurmasPorTurno(TurmasProvider turmasProvider, List<Map> listaMap) {
    //  debugPrint('teste: ${listaMap.toString()}');
    List<Map> listMatutino = [];
    List<Map> listVespertino = [];

    for (int i = 0; i < listaMap.length; i++) {
      if (listaMap[i].toString().contains('matutino')) {
        listMatutino.add(listaMap[i]);
      } else {
        listVespertino.add(listaMap[i]);
      }
    }
    adicionarCheckBox(turmasProvider, listMatutino, listVespertino);

    turmasProvider.setListaMatutino(listMatutino);
    turmasProvider.setTurmasVespertino(listVespertino);
  }

  adicionarCheckBox(TurmasProvider turmasProvider, List<Map> listTurmaMatutino,
      List<Map> listTurmaVespertino) {
    List<bool> listCheckBoxTurmaMatutino = [];
    List<bool> listCheckBoxTurmaVespertino = [];

    for (int indice = 0; indice < listTurmaMatutino.length; indice++) {
      listCheckBoxTurmaMatutino.add(false);
    }
    for (int indice = 0; indice < listTurmaVespertino.length; indice++) {
      listCheckBoxTurmaVespertino.add(false);
    }
    turmasProvider.setCheckBoxTurmasMatutino(listCheckBoxTurmaMatutino);
    turmasProvider.setCheckBoxTurmasVespertino(listCheckBoxTurmaVespertino);
  }
}
