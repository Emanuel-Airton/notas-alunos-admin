import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/alertDialog_cad_aluno.dart';
import 'package:notas_alunos_windows/features/turmas/data/database/turmas_firestore_repository.dart';

import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/container_info_turma.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/container_list_aluno.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/pie_chart.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class TurmaListAlunos extends StatefulWidget {
  const TurmaListAlunos({super.key});

  @override
  State<TurmaListAlunos> createState() => _TurmaListAlunosState();
}

class _TurmaListAlunosState extends State<TurmaListAlunos> {
  final TurmasFirestoreRepository fireTurmasFirestore =
      TurmasFirestoreRepository();

  @override
  Widget build(BuildContext context) {
    final turmaProvider = context.watch<TurmasProvider>();
    final turmaData = turmaProvider.turmaData;
    final list = turmaData['alunos'];
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          icon: Icon(Icons.add),
          onPressed: () {
            showDialog(
              useSafeArea: true,
              context: context,
              builder: (context) {
                return AlertdialogCadAluno();
              },
            );
          },
          label: Text('Adicionar aluno')),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Container(
              child: turmaProvider.isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              int contadorAluno = index + 1;
                              Alunos aluno = Alunos.semdados();
                              aluno.nomeAluno =
                                  turmaData['alunos'][index]['nome'] ?? '';
                              aluno.telefone =
                                  turmaData['alunos'][index]['telefone'] ?? '';
                              aluno.documentAluno =
                                  turmaData['alunos'][index]['id'] ?? '';
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ContainerListAluno(
                                  alunos: aluno,
                                  contador: contadorAluno,
                                ),
                              );
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ContainerInfoTurma(
                                child: Text(
                                  'Quantidade de alunos: ${turmaProvider.turmaData['quantidade']}',
                                  style: CustomTextStyle.fontNomeTurmaContainer,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  ContainerInfoTurma(child: PieChartSample()),
                            ),
                          ],
                        )
                      ],
                    ))),
    );
  }
}
