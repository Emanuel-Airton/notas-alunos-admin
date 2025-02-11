import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';
import 'package:provider/provider.dart';

class AlertdialogDeleteProfessor extends StatefulWidget {
  final ModelProfessor modelProfessor;

  const AlertdialogDeleteProfessor({super.key, required this.modelProfessor});

  @override
  State<AlertdialogDeleteProfessor> createState() =>
      _AlertdialogDeleteProfessorState();
}

class _AlertdialogDeleteProfessorState
    extends State<AlertdialogDeleteProfessor> {
  @override
  Widget build(BuildContext context) {
    final providerProfessor = Provider.of<ProviderProfessor>(context);
    return AlertDialog(
      title: Text('Deseja excluir o cadastro do(a) professor(a) ?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              try {
                providerProfessor.apagarProfessorFirestore(
                    widget.modelProfessor.idProfessor);
                Navigator.pop(context);
              } catch (erro) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Center(
                  child: Text('erro: $erro'),
                )));
              }
            },
            child: Text('Apagar'))
      ],
    );
  }
}
