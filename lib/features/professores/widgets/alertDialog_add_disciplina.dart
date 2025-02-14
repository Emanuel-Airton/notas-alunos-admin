import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/disciplinas/provider/disciplina_provider.dart';
import 'package:notas_alunos_windows/features/disciplinas/widgets/dropDownButtom_disciplinas.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/listView_checkBox_list_turmas.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/listView_checkBox_turmas_vespertino.dart';
import 'package:notas_alunos_windows/theme/container_theme.dart';
import 'package:notas_alunos_windows/widgets/buttons/button_salvar.dart';
import 'package:provider/provider.dart';

class AlertdialogAddDisciplina extends StatefulWidget {
  final ModelProfessor modelProfessor;
  const AlertdialogAddDisciplina({super.key, required this.modelProfessor});

  @override
  State<AlertdialogAddDisciplina> createState() =>
      _AlertdialogAddDisciplinaState();
}

class _AlertdialogAddDisciplinaState extends State<AlertdialogAddDisciplina> {
  List<bool> valorCheckBox = [];
  @override
  Widget build(BuildContext context) {
    final disciplinaProvider = Provider.of<DisciplinaProvider>(context);
    final turmasProvider = Provider.of<TurmasProvider>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: PopScope(
            canPop: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ContainerTheme.containerInputData(
                      const DropdownButtonDisciplinas(), double.maxFinite),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        children: [
                          /*   Text(
                            'Disciplina selecionada: ${disciplinaProvider.disciplina.nomeDisciplina ?? ''}',
                          ),*/
                          disciplinaProvider.disciplinaSelecionada
                              ? Row(
                                  children: [
                                    Flexible(
                                        child:
                                            ListViewCheckBoxTurmasMatutino()),
                                    Flexible(
                                        child:
                                            ListviewCheckboxTurmasVespertino()),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                      'Selecione primeiro a disciplina para escolher as turmas'),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        disciplinaProvider.limparDisciplinaProvider();
                        turmasProvider.limparListaTurmas();
                      },
                      child: const Text('Cancelar'),
                    ),
                    ButtonSalvar(onpressed: () {
                      setState(() {
                        try {
                          disciplinaProvider
                              .salvarDisciplinaFirestore(widget.modelProfessor);
                          Navigator.pop(context);
                          disciplinaProvider.limparDisciplinaProvider();
                        } catch (erro) {
                          debugPrint('erro ao salvar: $erro');
                        }
                      });
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
