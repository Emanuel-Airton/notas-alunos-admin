import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/data/database/turmas_firestore_repository.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ContainerTurma extends StatelessWidget {
  //final Function(int) navigateTo;
  late Widget child;
  late String nomeTurma;
  ContainerTurma({
    super.key,
    required this.child,
    required this.nomeTurma,
  });
  final TurmasFirestoreRepository _turmasFirestore =
      TurmasFirestoreRepository();
  @override
  Widget build(BuildContext context) {
    final turmaProvider = Provider.of<TurmasProvider>(context);
    return GestureDetector(
      onTap: () async {
        turmaProvider.setTurmaNome(nomeTurma);
        turmaProvider.navigateToPage(3);
        debugPrint(turmaProvider.nomeTurma);
        await _turmasFirestore.listarAlunosTurmaFirestore(
            turmaProvider.nomeTurma, turmaProvider);
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.1,
        width: MediaQuery.sizeOf(context).width * 0.14,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(1, 3))
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: child,
      ),
    );
  }
}
