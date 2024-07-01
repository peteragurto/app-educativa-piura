import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/domain/entities/alumno.dart';
import 'package:yachaywai/src/domain/entities/docente.dart';
import 'package:yachaywai/src/presentation/pages/auth/login_screen.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _signOut() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    try {
      await loginProvider.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      showSnackBar(context, "Error al cerrar sesión. Por favor intenta de nuevo.");
    }
  }

  //Funcion para devolver un widget de etiqueta si el usuario es alumno o docente
  Widget buildUserRoleLabel(String? userRole) {
      if (userRole == 'docente') {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.red, // Color for "Docente"
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Text(
            'Docente',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (userRole == 'alumno') {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.red.shade300, // Color for "Alumno"
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Text(
            'Alumno',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else {
        return const SizedBox.shrink(); // Return an empty widget if no role is found
      }
    }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final usuario = loginProvider.usuario;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Perfil",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.person_2_outlined,
              size: 100.0,
              color: Color.fromARGB(255, 158, 91, 3),
            ),
            buildUserRoleLabel(usuario?.rol),
            const SizedBox(height: 20.0),
            if (usuario != null) ...[
              Row(
                children: [
                  const Text(
                    "Nombre: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(usuario.nombre),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text(
                    "Correo electrónico: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      usuario.email,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text(
                    "DNI: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(usuario.dni),
                ],
              ),
              if (usuario is Alumno) ...[
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Text(
                      "Grado: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(usuario.grado),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Text(
                      "Nivel: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(usuario.nivel),
                  ],
                ),
              ] else if (usuario is Docente) ...[
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Text(
                      "Cursos Asignados: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        usuario.cursosAsignadosIds.join(', '),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 24.0,),
            ],
            Positioned(
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
                child: ElevatedButton(
                  onPressed: _signOut,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 158, 91, 3),
                  ),
                  child: const Text("Cerrar sesión"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
