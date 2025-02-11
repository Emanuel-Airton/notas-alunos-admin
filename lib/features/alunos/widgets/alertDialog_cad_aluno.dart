import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/alunos/provider/alunos_provider.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/dropDownButton_select_genero.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/radioListTile_aluno_deficiente.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/textFormField_texto_nome.dart';
import 'package:notas_alunos_windows/features/alunos/widgets/textFormField_texto_telefone.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/theme/container_theme.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:notas_alunos_windows/widgets/buttons/button_salvar.dart';
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
    final width = MediaQuery.sizeOf(context).width;
    final alunosProvider = Provider.of<AlunosProvider>(context);
    final turmasProvider = Provider.of<TurmasProvider>(context);

    return AlertDialog(
      title: Text('Cadastro de aluno',
          style: CustomTextStyle.fontNomeTurmaContainer),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(15),
        width: width * 0.4,
        // height: MediaQuery.sizeOf(context).height * 0.4,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ContainerTheme.containerInputData(
                  TextformfieldTextoNome(controllerNome: controllerNome),
                  double.maxFinite),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerTheme.containerInputData(
                      TextformfieldTextoTelefone(
                          controllerTelefone: controllerTelefone),
                      width * 0.18),
                  ContainerTheme.containerInputData(
                      DropdownbuttonSelectGenero(), width * 0.18),
                ],
              ),
              SizedBox(height: 15),
              RadiolisttileAlunoDeficiente(),
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
        ButtonSalvar(onpressed: () async {
          if (_key.currentState!.validate()) {
            try {
              alunosProvider.setAlunoNome(controllerNome.text);
              alunosProvider.setAlunoTelefone(controllerTelefone.text);
              await alunosProvider
                  .salvarDadosAlunosFirestore(turmasProvider.nomeTurma);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(
                    child: Text('Aluno registrado com sucesso'),
                  )));
            } catch (e) {
              debugPrint('mensagem de erro: ${e.toString()}');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(e.toString()),
                  )));
            }
          }
        })
      ],
    );
  }
}
