import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/database/database_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/models/model_aluno.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/radioListTile_aluno_deficiente.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/radioListTile_genero_aluno.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/theme/container_theme.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class AlertdialogCadAluno extends StatefulWidget {
  const AlertdialogCadAluno({super.key});

  @override
  State<AlertdialogCadAluno> createState() => _AlertdialogCadAlunoState();
}

class _AlertdialogCadAlunoState extends State<AlertdialogCadAluno> {
  final _key = GlobalKey<FormState>();
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cadastro de aluno',
          style: CustomTextStyle.fontNomeTurmaContainer),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.4,
        // height: MediaQuery.sizeOf(context).height * 0.4,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ContainerTheme.containerInputData(
                  TextFormField(
                    controller: controllerNome,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'insira o nome do aluno';
                      } else {
                        return null;
                      }
                    },
                    maxLength: 50,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'nome do aluno'),
                  ),
                  double.maxFinite),
              SizedBox(height: 15),
              ContainerTheme.containerInputData(
                  TextFormField(
                    controller: controllerTelefone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'insira o telefone do aluno';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Telefone para contato'),
                  ),
                  MediaQuery.of(context).size.width * 0.18),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadiolisttileGeneroAluno(),
                  SizedBox(width: 20),
                  RadiolisttileAlunoDeficiente()
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancelar')),
        Consumer<TurmasProvider>(
          builder: (context, value, child) {
            return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    try {
                      DatabaseAluno databaseAluno = DatabaseAluno();
                      Alunos aluno = Alunos.semdados();
                      aluno.nomeAluno = controllerNome.text;
                      aluno.telefone = controllerTelefone.text;
                      databaseAluno.salvarNovoAluno(value.nomeTurma, aluno);
                      debugPrint('aluno salvo');
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Center(
                            child: Text('Aluno registrado com sucesso'),
                          )));
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  }
                },
                child: Text(
                  'salvar',
                  style: TextStyle(color: Colors.white),
                ));
          },
        )
      ],
    );
  }
}
