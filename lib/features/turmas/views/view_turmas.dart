import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/futureBuilder_list_tumas.dart';
import 'package:provider/provider.dart';

class ViewTurmas extends StatefulWidget {
  // final Future<List> list;
  const ViewTurmas({super.key});

  @override
  State<ViewTurmas> createState() => _ViewTurmasState();
}

class _ViewTurmasState extends State<ViewTurmas> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TurmasProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          onPressed: () {
            provider.navigateToPage(4);
          },
          label: Text('Adicionar nova turma')),
      appBar: AppBar(),
      body: FutureListTurma(),
    );
  }
}
