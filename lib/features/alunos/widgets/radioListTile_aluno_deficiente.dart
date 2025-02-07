import 'package:flutter/material.dart';

enum CaracterUnico { sim, nao }

class RadiolisttileAlunoDeficiente extends StatefulWidget {
  const RadiolisttileAlunoDeficiente({super.key});

  @override
  State<RadiolisttileAlunoDeficiente> createState() =>
      _RadiolisttileAlunoDeficienteState();
}

class _RadiolisttileAlunoDeficienteState
    extends State<RadiolisttileAlunoDeficiente> {
  CaracterUnico caracterUnico = CaracterUnico.nao;
  @override
  Widget build(BuildContext context) {
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
              value: CaracterUnico.nao,
              groupValue: caracterUnico,
              onChanged: (value) {
                setState(() {
                  caracterUnico = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text('sim'),
            leading: Radio(
              value: CaracterUnico.sim,
              groupValue: caracterUnico,
              onChanged: (value) {
                setState(() {
                  caracterUnico = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
