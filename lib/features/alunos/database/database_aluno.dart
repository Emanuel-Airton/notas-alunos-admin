import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';

class DatabaseAluno {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  salvarNovoAluno(String nometurma, Alunos aluno) async {
    try {
      await _firebaseFirestore
          .collection('turmas')
          .doc(nometurma)
          .collection('alunos')
          .add({'nome': aluno.nomeAluno, 'telefone': aluno.telefone});
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }

  removerAluno(String nometurma, Alunos aluno) async {
    try {
      await _firebaseFirestore
          .collection('turmas')
          .doc(nometurma)
          .collection('alunos')
          .doc(aluno.documentAluno)
          .delete();
    } on FirebaseException catch (e) {
      throw '${e.message}';
    }
  }
}
