import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/data/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/services/turmas_services.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/container_turma.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class GridviewListTurmas extends StatelessWidget {
  late List<ModelTurmas> listTurno;
  // final Function(int) navigateTo;
  GridviewListTurmas({
    super.key,
    required this.listTurno,
  });

  @override
  Widget build(BuildContext context) {
    final turmaProvider = context.watch<TurmasProvider>();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2,
          crossAxisCount: 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listTurno.length,
      itemBuilder: (context, index) {
        String nomeTurma = listTurno[index].nomeTuma.toString();
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ContainerTurma(
            // navigateTo: navigateTo(3),
            nomeTurma: nomeTurma,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nomeTurma, style: CustomTextStyle.fontNomeTurmaContainer),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () async {
                        try {
                          turmaProvider.deletarTurma(
                              listTurno[index].document.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text('turma apagada com sucesso'),
                          )));
                          await turmaProvider.listaTurmasFirestore2();
                          TurmasServices turmasServices = TurmasServices();
                          turmasServices.separarTurmasPorTurno(
                              turmaProvider, turmaProvider.listaTurmas);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text('Erro ao apagar turma: $e'),
                          )));
                        }
                      },
                      icon: Icon(Icons.delete, color: Colors.grey)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
