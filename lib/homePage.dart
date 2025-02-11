import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/database/database_professor.dart';
import 'package:notas_alunos_windows/features/professores/views/view_professor.dart';
import 'package:notas_alunos_windows/features/turmas/database/database_turmas.dart';
import 'package:notas_alunos_windows/features/turmas/models/model_turma.dart';
import 'package:notas_alunos_windows/features/turmas/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/features/turmas/views/view_add_turma.dart';
import 'package:notas_alunos_windows/features/turmas/views/view_turma_list_alunos.dart';
import 'package:notas_alunos_windows/features/turmas/views/view_turmas.dart';
import 'package:notas_alunos_windows/sideBar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> list;
  Turmas turmas = Turmas();
  TurmasFirestore turmasFirestore = TurmasFirestore();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    list = turmasFirestore.listaTurmas();
    debugPrint('print');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TurmasProvider>(context);
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.2,
            color: Theme.of(context).colorScheme.inversePrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerHeader(
                    child: Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
                SideBarItem(
                  icon: Icons.home,
                  title: "Início",
                  indice: 0,
                ),
                SideBarItem(
                  icon: Icons.list,
                  title: "Turmas",
                  indice: 1,
                ),
                //isSelected: _selectedIndex == 1,
                //function: () => navigateToPage(1)),
                SideBarItem(
                  icon: Icons.person,
                  title: "Professores",
                  indice: 2,
                ),
              ],
            ),
          ),
          Expanded(
              child: PageView(
            controller: provider.pageController,
            children: [
              Center(
                  child:
                      Text("Página Inicial", style: TextStyle(fontSize: 24))),
              ViewTurmas(list: list),
              ViewProfessor(),
              TurmaListAlunos(),
              ViewAddTurma(),
            ],
          ))
        ],
      ),
    );
  }
}
