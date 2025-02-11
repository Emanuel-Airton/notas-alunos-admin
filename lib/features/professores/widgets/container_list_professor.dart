import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/alertDialog_delete_professor.dart';

class ContainerListProfessor extends StatelessWidget {
  final ModelProfessor modelProfessor;
  const ContainerListProfessor({super.key, required this.modelProfessor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      width: MediaQuery.sizeOf(context).width * 0.6,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(1, 3))],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
