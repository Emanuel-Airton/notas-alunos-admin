import 'package:flutter/material.dart';

class ButtonSalvar extends StatelessWidget {
  final Function()? onpressed;
  const ButtonSalvar({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(Theme.of(context).colorScheme.primary)),
        onPressed: onpressed,
        child: Text(
          'salvar',
          style: TextStyle(color: Colors.white),
        ));
  }
}
