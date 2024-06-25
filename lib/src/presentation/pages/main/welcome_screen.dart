import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';
import 'package:yachaywai/src/presentation/pages/main/courselist_screen.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';
import 'package:yachaywai/src/presentation/widgets/rounded_image.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);
    Usuario? usuario = loginProvider.usuario;

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

    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: RoundedImage(
                          imagePath: 'assets/asis/asis-senor.png', 
                          initialRadius: 36.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Bienvenido',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Text(
                      usuario?.nombre ?? '',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 158, 91, 3),
                    ),
                    buildUserRoleLabel(usuario?.rol)
                  ],
                ),
                const SizedBox(height: 16.0,),
                SizedBox(
                  height: 100,
                  child: ClipRRect( // Agregamos ClipRRect
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: double.infinity,
                      color: const Color.fromARGB(255, 158, 91, 3).withOpacity(0.8),
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/asis/laptop1.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 158, 91, 3),
                    borderRadius: BorderRadius.circular(10.0), // Esquinas redondeadas
                  ),
                  child: const Text(
                    "Esta es la plataforma para compartir recursos y anuncios en la institución San Francisco de Asis.", // Mensaje de bienvenida
                    style: TextStyle(
                      color: Colors.white, // Texto en blanco
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 16), // Espacio entre contenedores
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CourseListScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 158, 91, 3),
                        width: 3.0
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.book,
                          color: Color.fromARGB(255, 158, 91, 3),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Cursos",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}