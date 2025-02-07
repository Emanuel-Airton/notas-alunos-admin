import 'package:flutter/material.dart';

enum SingingCharacter { masculino, feminino }

class RadiolisttileGeneroAluno extends StatefulWidget {
  const RadiolisttileGeneroAluno({super.key});

  @override
  State<RadiolisttileGeneroAluno> createState() =>
      _RadiolisttileGeneroAlunoState();
}

class _RadiolisttileGeneroAlunoState extends State<RadiolisttileGeneroAluno> {
  SingingCharacter character = SingingCharacter.masculino;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.sizeOf(context).width * 0.10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Genero'),
          ListTile(
            title: const Text('Masculino'),
            leading: Radio(
              value: SingingCharacter.masculino,
              groupValue: character,
              onChanged: (value) {
                setState(() {
                  character = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Feminino'),
            leading: Radio(
              value: SingingCharacter.feminino,
              groupValue: character,
              onChanged: (value) {
                setState(() {
                  character = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
