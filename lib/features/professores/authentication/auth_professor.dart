import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';

class AuthProfessor {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  criarUsuarioProfesor(ModelProfessor modelProfessor) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: modelProfessor.emailProfessor,
              password: modelProfessor.senha);
      if (userCredential.user != null) {
        DatabaseProfessor databaseProfessor = DatabaseProfessor();
        modelProfessor.idProfessor = userCredential.user!.uid;
        await databaseProfessor.adicionarProfessor(modelProfessor);
      }
      debugPrint('professor cadastrado com sucesso');
    } on FirebaseAuthException catch (e) {
      throw Exception('erro desconhecido ao criar usuario ${e.message}');
    } catch (e) {
      throw Exception('erro desconhecido ao criar usuario $e');
    }
  }
}
