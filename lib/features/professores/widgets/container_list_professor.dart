import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/alertDialog_add_disciplina.dart';
import 'package:notas_alunos_windows/features/professores/widgets/alertDialog_delete_professor.dart';
import 'package:notas_alunos_windows/models/model_disciplina.dart';

class ContainerListProfessor extends StatelessWidget {
  final ModelProfessor modelProfessor;
  const ContainerListProfessor({super.key, required this.modelProfessor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width * 0.5,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(1, 3))],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(modelProfessor.nomeProfessor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Tooltip(
                    message: 'Atualizar dados do professor',
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.create, color: Colors.grey)),
                  ),
                  Tooltip(
                    message: 'Excluir professor',
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertdialogDeleteProfessor(
                                    modelProfessor: modelProfessor);
                              });
                        },
                        icon: Icon(Icons.delete, color: Colors.grey)),
                  ),
                ],
              )
            ],
          ),
          Center(
              child: modelProfessor.disciplina.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: modelProfessor.disciplina.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(2, 2))
                                  ]),
                              child: Text(modelProfessor.disciplina[index]
                                      ['nome']
                                  .toString())),
                        );
                      },
                    )
                  : Container()),
          ElevatedButton.icon(
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertdialogAddDisciplina(
                          modelProfessor: modelProfessor);
                    });
              },
              label: Text('Adicionar disciplina'))
        ],
      ),
    );
  }
}
