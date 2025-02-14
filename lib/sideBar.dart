import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';
import 'package:notas_alunos_windows/features/turmas/database/database_turmas.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';
import 'package:provider/provider.dart';

class SideBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final int indice;
  SideBarItem(
      {super.key,
      required this.icon,
      required this.title,
      // required this.function,
      // required this.isSelected,
      required this.indice});

  @override
  State<SideBarItem> createState() => _SideBarItemState();
}

class _SideBarItemState extends State<SideBarItem> {
  @override
  Widget build(BuildContext context) {
    final turmasProvider = Provider.of<TurmasProvider>(context);
    final professorProvider = Provider.of<ProviderProfessor>(context);

    return ListTile(
      leading: Icon(widget.icon, color: Colors.white),
      title: Text(widget.title, style: CustomTextStyle.fontSideBarItens),
      // onTap: widget.function,
      onTap: () {
        turmasProvider.navigateToPage(widget.indice);
        if (widget.indice == 2) {
          DatabaseProfessor databaseProfessor = DatabaseProfessor();
          databaseProfessor.listarProfessores(professorProvider);
        } else if (widget.indice == 1) {
          TurmasFirestore turmasFirestore = TurmasFirestore();
          turmasFirestore.listaTurmas(turmasProvider);
        }
      },
    );
  }
}
