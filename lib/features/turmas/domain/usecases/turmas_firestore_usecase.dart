import 'package:notas_alunos_windows/features/turmas/data/database/turmas_firestore_repository.dart';
import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';

class TurmasFirestoreUsecase {
  final TurmasFirestoreRepository _turmasFirestoreRepository;
  TurmasFirestoreUsecase(this._turmasFirestoreRepository);

  Future<List<ModelTurmas>> listTurmas() async {
    return await _turmasFirestoreRepository.listaTurmas();
  }

  void deletarTurma(String document) async {
    return _turmasFirestoreRepository.deletarTurma(document);
  }
}
