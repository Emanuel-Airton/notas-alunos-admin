import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';

class DatabaseAluno {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  DocumentReference getAlunoReference(String nometurma, Alunos aluno) {
    String docId = aluno.documentAluno.isNotEmpty
        ? aluno.documentAluno
        : _firebaseFirestore
            .collection('turmas')
            .doc(nometurma)
            .collection('alunos')
            .doc()
            .id;

    return _firebaseFirestore
        .collection('turmas')
        .doc(nometurma)
        .collection('alunos')
        .doc(docId);
  }

  Future<void> salvarNovoAluno(String nometurma, Alunos aluno) async {
    try {
      _firebaseFirestore
          .collection('turmas')
          .doc(nometurma)
          .collection('alunos')
          .add(aluno.toMapCadastroAluno());
    } on FirebaseException catch (e) {
      debugPrint('Erro ao salvar aluno: ${e.message}');
      throw Exception('Falha ao salvar o aluno: ${e.message}');
    } catch (e) {
      //debugPrint('Erro inesperado: $e');
      throw Exception('Erro desconhecido ao salvar aluno: ${e.toString()}');
    }
  }

  removerAluno(String nometurma, Alunos aluno) async {
    try {
      DocumentReference documentReference = getAlunoReference(nometurma, aluno);
      documentReference.delete();
    } on FirebaseException catch (e) {
      throw Exception('Falha ao salvar o aluno: ${e.message}');
    } catch (e) {
      debugPrint('Erro inesperado: $e');
      throw Exception('Erro desconhecido ao salvar aluno');
    }
  }

  atualizarDadosAluno(String nometurma, Alunos aluno) {
    try {
      DocumentReference documentReference = getAlunoReference(nometurma, aluno);
      documentReference
          .update({'nome': aluno.nomeAluno, 'telefone': aluno.telefone});
    } on FirebaseException catch (e) {
      throw Exception(
          'Falha ao atualizar as informações do aluno: ${e.message}');
    } catch (e) {
      throw Exception('Erro desconhecido ao atualizar aluno');
    }
  }
}
