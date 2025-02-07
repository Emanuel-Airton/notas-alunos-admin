import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/gridView_list_turmas.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';

class FutureListTurma extends StatefulWidget {
  //final Function(Widget) navigateTo; // Função para navegar para outra página
  //final Function(int) navigateToPage;
  late Future<List> list;
  FutureListTurma({
    super.key,
    required this.list,
  });

  @override
  State<FutureListTurma> createState() => _FutureListTurmaState();
}

class _FutureListTurmaState extends State<FutureListTurma> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: widget.list,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Erro ao carregar dados!',
                style: CustomTextStyle.fontNomeAlunoTurma,
              ));
            }
            List listaMap = snapshot.data ?? [];
            List listMatutino = [];
            List listVespertino = [];
            for (int i = 0; i < listaMap.length; i++) {
              if (listaMap[i].toString().contains('matutino')) {
                listMatutino.add(listaMap[i]);
              } else {
                listVespertino.add(listaMap[i]);
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  GridviewListTurmas(
                    listTurno: listMatutino,
                    //navigateTo: widget.navigateToPage(3),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GridviewListTurmas(
                    listTurno: listVespertino,
                    // navigateTo: widget.navigateToPage(3)
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
