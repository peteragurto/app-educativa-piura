import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/presentation/pages/auth/login_screen.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final usuario = loginProvider.usuario;

    return SafeArea(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Perfil"),
              const SizedBox(height: 20.0),
              if(usuario != null)
                Column(
                  children: [
                    Text('Nombre: ${usuario.nombre}', style: const TextStyle(fontSize: 18.0)),
                    Text('Email: ${usuario.email}', style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        await loginProvider.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text('Cerrar sesión'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 158, 91, 3),
                      ),
                    ),
                  ],
                )
              else
                const Text("No hay datos"),
            ],
          ),
        ),
      );
  }
}