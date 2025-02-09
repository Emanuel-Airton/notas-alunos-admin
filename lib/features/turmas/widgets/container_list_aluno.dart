import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/alertDialog_delete_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/alertDialog_edit_aluno.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ContainerListAluno extends StatelessWidget {
  Alunos alunos;
  final int contador;
  ContainerListAluno({super.key, required this.contador, required this.alunos});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.07,
      // width: MediaQuery.sizeOf(context).width * 0.4,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(1, 3))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                child: CircleAvatar(
                  child: Text(contador.toString()),
                ),
              ),
              Text(
                alunos.nomeAluno,
                style: CustomTextStyle.fontNomeAlunoTurma,
              )!
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                  child: Tooltip(
                    message: 'Editar as informações do aluno',
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertdialogEditAluno(alunos: alunos);
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.grey,
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                  child: Tooltip(
                    message: 'Excluir o aluno da turma',
                    child: Consumer<TurmasProvider>(
                      builder: (context, value, child) {
                        return IconButton(
                            onPressed: () async {
                              try {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertdialogDeleteAluno(
                                        alunos: alunos);
                                  },
                                );
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ));
                      },
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
