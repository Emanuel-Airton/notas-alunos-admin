import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/provider/alunos_provider.dart';
import 'package:provider/provider.dart';

class RadiolisttileAlunoDeficiente extends StatefulWidget {
  const RadiolisttileAlunoDeficiente({super.key});

  @override
  State<RadiolisttileAlunoDeficiente> createState() =>
      _RadiolisttileAlunoDeficienteState();
}

class _RadiolisttileAlunoDeficienteState
    extends State<RadiolisttileAlunoDeficiente> {
  bool valor = false;
  Alunos alunos = Alunos.semdados();
  @override
  Widget build(BuildContext context) {
    final alunosProvider = Provider.of<AlunosProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      alunosProvider.setAlunoPossuiDeficiencia(valor);
      // Add Your Code here.
    });
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.sizeOf(context).width * 0.10,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text('O aluno possui deficiencia?'),
          ListTile(
            title: Text('não'),
            leading: Radio(
              value: false,
              groupValue: valor,
              onChanged: (value) {
                setState(() {
                  valor = value!;
                  alunosProvider.setAlunoPossuiDeficiencia(valor);
                });
              },
            ),
          ),
          ListTile(
            title: Text('sim'),
            leading: Radio(
              value: true,
              groupValue: valor,
              onChanged: (value) {
                setState(() {
                  valor = value!;

                  alunosProvider.setAlunoPossuiDeficiencia(valor);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
