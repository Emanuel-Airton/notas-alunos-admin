import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';

class ContainerInfoTurma extends StatelessWidget {
  final Widget child;
  const ContainerInfoTurma({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        width: MediaQuery.sizeOf(context).width * 0.14,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(1, 3))
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: child);
  }
}
