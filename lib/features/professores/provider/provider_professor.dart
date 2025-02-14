import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/authentication/auth_professor.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';

class ProviderProfessor extends ChangeNotifier {
  ModelProfessor modelProfessor = ModelProfessor();
  bool isloading = false;
  List<Map<String, dynamic>> listaProfessores = [];
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

  setSenhaProfessor(String senha) {
    modelProfessor.senha = senha;
    notifyListeners();
  }

  /*salvarProfessorFirestore() async {
    await databaseProfessor.adicionarProfessor(modelProfessor);
    notifyListeners();
  }*/
  salvarAuthProfessor() async {
    AuthProfessor authProfessor = AuthProfessor();
    await authProfessor.criarUsuarioProfesor(modelProfessor);
    notifyListeners();
  }

  apagarProfessorFirestore(String id) async {
    await databaseProfessor.removerProfessor(id);
    notifyListeners();
  }

  providerListarProfessores(List<Map<String, dynamic>> listaRecebida) {
    isloading = true;
    notifyListeners();
    listaProfessores = listaRecebida;
    isloading = false;
    for (int i = 0; i < listaProfessores.length; i++) {
      setIDProfessor(listaProfessores[i]['id']);
    }
    notifyListeners();
  }
}
