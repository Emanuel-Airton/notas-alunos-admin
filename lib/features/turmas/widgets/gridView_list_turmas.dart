import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/container_turma.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';

class GridviewListTurmas extends StatelessWidget {
  late List listTurno;
  // final Function(int) navigateTo;
  GridviewListTurmas({
    super.key,
    required this.listTurno,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2,
          crossAxisCount: 5),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listTurno.length,
      itemBuilder: (context, index) {
        String nomeTurma = listTurno[index];

        return Padding(
          padding: const EdgeInsets.all(15),
          child: ContainerTurma(
            // navigateTo: navigateTo(3),
            nomeTurma: nomeTurma,
            child:
                Text(nomeTurma, style: CustomTextStyle.fontNomeTurmaContainer),
          ),
        );
      },
    );
  }
}
