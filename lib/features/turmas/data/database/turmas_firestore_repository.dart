import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';

class TurmasFirestoreRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final String colecaoTurmas = 'turmas';
  final String colecaoAlunos = 'alunos';

  Future listaTurmas() async {
    List<ModelTurmas> listTurmas = [];
    QuerySnapshot queryDocumentSnapshot =
        await _firebaseFirestore.collection('turmas').get();
    for (DocumentSnapshot doc in queryDocumentSnapshot.docs) {
      Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
      Map<String, dynamic> mapTurma = {
        'nome': map['nome'],
        'turno': map['turno'],
        'document': doc.id
      };
      listTurmas.add(ModelTurmas.fromJson(mapTurma));
    }
    return listTurmas;
    /*   turmasProvider.listaTurmasFirestore(list);
    turmasServices.separarTurmasPorTurno(turmasProvider, list);*/
    // return list;
  }

  void deletarTurma(String document) async {
    try {
      _firebaseFirestore.collection(colecaoTurmas).doc(document).delete();
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  salvarTurma(ModelTurmas turma) async {
    final String turmaFormatada = '${turma.nomeTuma} ${turma.turno}';
    String mensagem = '';
    try {
      DocumentSnapshot documentSnapshot = await _firebaseFirestore
          .collection(colecaoTurmas)
          .doc(turmaFormatada)
          .get();
      if (documentSnapshot.exists) {
        mensagem = 'Essa turma já existe';
        debugPrint(mensagem);
      } else {
        await _firebaseFirestore
            .collection(colecaoTurmas)
            .doc(turmaFormatada)
            .set(turma.toJson())
            .then(
          (value) {
            mensagem = 'Turma adicionada com sucesso';
          },
        );
      }
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
    }
    return mensagem;
  }

  listarAlunosTurmaFirestore(
      String turma, TurmasProvider turmasProvider) async {
    List<Map> listAlunosTurma = [];
    Map<String, dynamic> mapTurma = {};
    return _firebaseFirestore
        .collection("turmas")
        .doc(turma)
        .collection(colecaoAlunos)
        .snapshots()
        .listen((querySnapshot) {
      listAlunosTurma.clear();
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> mapAlunos =
            documentSnapshot.data() as Map<String, dynamic>;

        Map map = {
          'nome': mapAlunos["nome"],
          'telefone': mapAlunos['telefone'],
          'id': documentSnapshot.id,
        };
        listAlunosTurma.add(map);
      }
      mapTurma = {
        "quantidade": listAlunosTurma.length,
        "alunos": listAlunosTurma
      };
      //debugPrint(mapTurma.toString());
      turmasProvider.setStreamAlunos(mapTurma);

      listAlunosTurma.sort(
        (a, b) {
          String nomeA = a["nome"];
          String nomeB = b["nome"];
          return nomeA.compareTo(nomeB);
        },
      );
    });
  }
}
