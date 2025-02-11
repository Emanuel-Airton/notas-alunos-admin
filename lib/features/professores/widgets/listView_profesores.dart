import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/features/professores/models/model_professor.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';
import 'package:notas_alunos_windows/features/professores/widgets/container_list_professor.dart';
import 'package:provider/provider.dart';

class ListviewProfesores extends StatefulWidget {
  const ListviewProfesores({super.key});

  @override
  State<ListviewProfesores> createState() => _ListviewProfesoresState();
}

class _ListviewProfesoresState extends State<ListviewProfesores> {
  @override
  Widget build(BuildContext context) {
    final professoresProvider = context.watch<ProviderProfessor>();

    List<Map<String, dynamic>> lista = professoresProvider.listaProfessores;
    return Container(
        padding: EdgeInsets.all(15),
        child: professoresProvider.isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> mapProfesor = lista[index];
                  ModelProfessor modelProfessor = ModelProfessor();
                  modelProfessor.idProfessor = mapProfesor['id'];
                  modelProfessor.nomeProfessor = mapProfesor['nome'];
                  modelProfessor.emailProfessor = mapProfesor['email'];

                  debugPrint(
                      'id atual: ${professoresProvider.modelProfessor.idProfessor}');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ContainerListProfessor(modelProfessor: modelProfessor),
                  );
                },
              ));
  }
}
