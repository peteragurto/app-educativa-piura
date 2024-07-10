import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/presentation/pages/main/selectedcourse_screen.dart';
import 'package:yachaywai/src/presentation/providers/curso_provider.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();
    _loadCursos();
  }

  void _loadCursos() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final usuario = loginProvider.usuario;

    if (usuario != null) {
      final cursosProvider = Provider.of<CursosProvider>(context, listen: false);
      cursosProvider.loadCursos(usuario.id);
    }
  }

  String getImageForCurso(String cursoNombre) {
      if (cursoNombre.toLowerCase().contains('matemática')) {
        return 'assets/asis/mates.png';
      } else if (cursoNombre.toLowerCase().contains('comunicación')) {
        return 'assets/asis/comunicacion.png';
      } else {
        return 'assets/asis/laptop1.png'; // Por si no coincide con ningún título conocido
      }
    }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos Asignados'),
        backgroundColor: const Color.fromARGB(255, 158, 91, 3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CursosProvider>(
          builder: (context, cursosProvider, child) {
            if (cursosProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (cursosProvider.cursos.isEmpty) {
              return const Center(child: Text('No tienes cursos asignados.'));
            }

            final loginProvider = Provider.of<LoginProvider>(context);
            final isStudent = loginProvider.usuario?.rol == 'alumno';
        
            return ListView.builder(
              itemCount: cursosProvider.cursos.length,
              itemBuilder: (context, index) {
                final curso = cursosProvider.cursos[index];
                final cursoImage = getImageForCurso(curso.nombre);
        
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectedCourseScreen(
                          cursoNombre: curso.nombre, 
                          isStudent: isStudent,
                          cursoId: curso.id
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Image.asset(
                              cursoImage,
                              height: 100.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      curso.nombre,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      'Grado: ${curso.grado}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      'Nivel: ${curso.nivel}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  )
                );
              },
            );
          },
        ),
      ),
    );
  }
}