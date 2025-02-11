import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';

class DatabaseProfessor {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String colecaoProfessores = 'professores';
  listarProfessores(ProviderProfessor providerProfessor) async {
    List<Map<String, dynamic>> listMapProfessores = [];
    _firebaseFirestore
        .collection(colecaoProfessores)
        .snapshots()
        .listen((querySnapshot) {
      listMapProfessores.clear();
      for (DocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> mapDadosProfessores =
            documentSnapshot.data() as Map<String, dynamic>;
        Map<String, dynamic> mapProfessor = {
          'nome': mapDadosProfessores['nome'],
          'email': mapDadosProfessores['email'],
          'id': documentSnapshot.id
        };
        listMapProfessores.add(mapProfessor);
      }
      providerProfessor.providerListarProfessores(listMapProfessores);
    });
  }

  adicionarProfessor(ModelProfessor professor) async {
    try {
      await _firebaseFirestore
          .collection(colecaoProfessores)
          .add(professor.professorToMap());
    } on FirebaseException catch (erro) {
      throw Exception('Erro ao salvar professor: ${erro.message}');
    } catch (erro) {
      throw Exception('Erro desconhecido ao tentar salvar professor: $erro');
    }
  }

  removerProfessor(String idProfessor) async {
    try {
      await _firebaseFirestore
          .collection(colecaoProfessores)
          .doc(idProfessor)
          .delete();
    } on FirebaseException catch (erro) {
      throw Exception('Erro ao deletar professor: ${erro.message}');
    } catch (erro) {
      throw Exception('Erro desconhecido ao tentar deletar professor: $erro');
    }
  }

  atualizarProfessor(ModelProfessor professor) async {
    try {
      await _firebaseFirestore
          .collection(colecaoProfessores)
          .doc(professor.idProfessor)
          .update(professor.professorToMap());
    } on FirebaseException catch (erro) {
      throw Exception(
          'Erro ao atualizar os dados do professor: ${erro.message}');
    } catch (erro) {
      throw Exception(
          'Erro desconhecido ao tentar atualizar os dados do professor: $erro');
    }
  }
}
