import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';

class ProviderProfessor extends ChangeNotifier {
  ModelProfessor modelProfessor = ModelProfessor();
  bool isloading = false;
  late List<Map<String, dynamic>> listaProfessores;
  DatabaseProfessor databaseProfessor = DatabaseProfessor();

  setNomeProfessor(String nome) {
    modelProfessor.nomeProfessor = nome;
    notifyListeners();
  }

  setEmailProfessor(String email) {
    modelProfessor.emailProfessor = email;
    notifyListeners();
  }

  setIDProfessor(String id) {
    modelProfessor.idProfessor = id;
    notifyListeners();
  }

  salvarProfessorFirestore() async {
    await databaseProfessor.adicionarProfessor(modelProfessor);
    notifyListeners();
  }

  apagarProfessorFirestore(String id) async {
    await databaseProfessor.removerProfessor(id);
    notifyListeners();
  }

  providerListarProfessores(List<Map<String, dynamic>> listaRecebida) {
    isloading = true;
    notifyListeners();
    if (listaRecebida.isNotEmpty) {
      listaProfessores = listaRecebida;
      isloading = false;
      notifyListeners();
    }
  }
}
