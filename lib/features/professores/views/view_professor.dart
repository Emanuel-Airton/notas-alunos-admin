import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/widgets/alertDialog_cadastro_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/listView_profesores.dart';

class ViewProfessor extends StatefulWidget {
  const ViewProfessor({super.key});

  @override
  State<ViewProfessor> createState() => _ViewProfessorState();
}

class _ViewProfessorState extends State<ViewProfessor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertdialogCadastroProfessor();
              },
            );
          },
          label: Text('Adicionar professor')),
      appBar: AppBar(),
      body: ListviewProfesores(),
    );
  }
}
