import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/database/database_turmas.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
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
  final TurmasFirestore _turmasFirestore = TurmasFirestore();
  @override
  Widget build(BuildContext context) {
    final turmaProvider = Provider.of<TurmasProvider>(context);
    return GestureDetector(
      onTap: () {
        turmaProvider.setTurmaNome(nomeTurma);
        turmaProvider.navigateToPage(3);
        debugPrint(turmaProvider.nomeTurma);
        _turmasFirestore.listarAlunosTurmaFirestore(
            turmaProvider.nomeTurma, turmaProvider);
        // turmaProvider.listAlunos(mapAlunos);
        //debugPrint(provider.alunos.toString());

        // navigateTo(3);
        /* Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TurmaListAlunos(
                      nomeTurma: nomeTurma,
                    )));*/
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
