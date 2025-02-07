import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/form_add_turma.dart';

class ViewAddTurma extends StatefulWidget {
  const ViewAddTurma({super.key});

  @override
  State<ViewAddTurma> createState() => _ViewAddTurmaState();
}

class _ViewAddTurmaState extends State<ViewAddTurma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de turma'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(3, 3))
                ]),
            child: FormAddTurma()),
      ),
    );
  }
}
