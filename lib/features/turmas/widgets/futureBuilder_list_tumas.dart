import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/gridView_list_turmas.dart';
import 'package:provider/provider.dart';

class FutureListTurma extends StatefulWidget {
  //final Function(Widget) navigateTo; // Função para navegar para outra página
  //final Function(int) navigateToPage;
  //late Future<List> list;
  const FutureListTurma({
    super.key,
    // required this.list,
  });

  @override
  State<FutureListTurma> createState() => _FutureListTurmaState();
}

class _FutureListTurmaState extends State<FutureListTurma> {
  @override
  Widget build(BuildContext context) {
    final turmasProvider = Provider.of<TurmasProvider>(context);

    debugPrint('turmas matutino: ${turmasProvider.turmasMatutino.toString()}');
    return Container(
        padding: EdgeInsets.all(15),
        child: turmasProvider.isloading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    GridviewListTurmas(
                      listTurno: turmasProvider.turmasMatutino,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GridviewListTurmas(
                      listTurno: turmasProvider.turmasVespertino,
                    ),
                  ],
                ),
              ));
  }
}
