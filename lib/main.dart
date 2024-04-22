import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yachaywai/screens/bienvenida.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yachaywai/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}
