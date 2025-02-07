import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/button_save_turma.dart';
import 'package:notas_alunos_windows/features/turmas/widgets/dropDownButton_select_turno.dart';

class FormAddTurma extends StatefulWidget {
  const FormAddTurma({super.key});

  @override
  State<FormAddTurma> createState() => _FormAddTurmaState();
}

class _FormAddTurmaState extends State<FormAddTurma> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final String valor = 'Matutino';
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              padding: const EdgeInsets.only(
                left: 5,
                top: 12,
                right: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                  //  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: TextFormField(
                      controller: _textEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'insira o nome da turma';
                        } else {
                          return null;
                        }
                      },
                      maxLength: 10,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome da turma ex: 6° ano A',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF7E7E7E))))),
            ),
            SizedBox(height: 30),
            DropdownbuttonSelectTurno(formkey: _key),
            SizedBox(height: 30),
            ButtonSaveTurma(
                formKey: _key, textEditingController: _textEditingController)
          ],
        ));
  }
}
