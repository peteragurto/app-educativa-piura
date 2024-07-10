import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/data/repositories/curso_repository_impl.dart';
import 'package:yachaywai/src/data/repositories/firebase_auth_repository_impl.dart';
import 'package:yachaywai/src/data/repositories/recurso_repository_impl.dart';
import 'package:yachaywai/src/domain/usecases/get_cursos_usecase.dart';
import 'package:yachaywai/src/domain/usecases/log_in_use_case.dart';
import 'package:yachaywai/src/presentation/pages/auth/initial_screen.dart';
import 'package:yachaywai/src/presentation/providers/curso_provider.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';
import 'package:yachaywai/src/presentation/providers/recurso_provider.dart';
import 'package:yachaywai/src/presentation/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(LoginUseCase(FireBaseAuthRepositoryImpl()))
        ),
        ChangeNotifierProvider<CursosProvider>(
          create: (context) => CursosProvider(GetCursosAsignadosUseCase(FirebaseCursoRepositoryImpl())),
        ),
        ChangeNotifierProvider<RecursoProvider>(
          create: (context) => RecursoProvider(FirebaseRecursoEducativoImpl(
            FirebaseFirestore.instance,
            FirebaseStorage.instance
            )
          ) 
        )
      ], 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: const InitialScreen(),
      ),
    );
  }
}
