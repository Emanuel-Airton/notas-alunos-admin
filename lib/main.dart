import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notas_alunos_windows/features/alunos/provider/alunos_provider.dart';
import 'package:notas_alunos_windows/features/disciplinas/provider/disciplina_provider.dart';
import 'package:notas_alunos_windows/features/professores/provider/provider_professor.dart';
import 'package:notas_alunos_windows/features/turmas/presentation/provider/turmas_provider.dart';
import 'package:notas_alunos_windows/firebase_options.dart';
import 'package:notas_alunos_windows/homePage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((_) => TurmasProvider())),
    ChangeNotifierProvider(create: ((_) => AlunosProvider())),
    ChangeNotifierProvider(create: ((_) => ProviderProfessor())),
    ChangeNotifierProvider(create: ((_) => DisciplinaProvider()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color.fromRGBO(237, 105, 105, 1),
          seedColor: const Color.fromRGBO(237, 105, 105, 1),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
