import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/textField_email_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/textField_nome_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/textField_senha_professor.dart';
import 'package:notas_alunos_windows/theme/container_theme.dart';
import 'package:notas_alunos_windows/widgets/buttons/button_salvar.dart';
import 'package:provider/provider.dart';

class AlertdialogCadastroProfessor extends StatefulWidget {
  const AlertdialogCadastroProfessor({super.key});

  @override
  State<AlertdialogCadastroProfessor> createState() =>
      _AlertdialogCadastroProfessorState();
}

class _AlertdialogCadastroProfessorState
    extends State<AlertdialogCadastroProfessor> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return AlertDialog(
      title: Text('Cadastro de professor'),
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(15),
        width: width * 0.4,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ContainerTheme.containerInputData(
                  TextfieldNomeProfessor(controllerNome: controllerNome),
                  double.maxFinite),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerTheme.containerInputData(
                      TextfieldEmailProfessor(controllerEmail: controllerEmail),
                      width * 0.18),
                  ContainerTheme.containerInputData(
                      TextfieldSenhaProfessor(
                          controllerSenha: controllerPassword),
                      width * 0.18),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [
        Consumer<ProviderProfessor>(
          builder: (context, value, child) {
            return ButtonSalvar(onpressed: () {
              if (_key.currentState!.validate()) {
                try {
                  value.setNomeProfessor(controllerNome.text);
                  value.setEmailProfessor(controllerEmail.text);
                  value.salvarProfessorFirestore();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Center(child: Text('professor salvo'))));
                } catch (erro) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(child: Text('erro ao salvar: $erro'))));
                }
              }
            });
          },
        )
      ],
    );
  }
}
