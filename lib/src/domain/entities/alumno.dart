import 'package:yachaywai/src/domain/entities/curso.dart';

class Alumno {
  final String id;
  final String nombre;
  final String email;
  final String dni;
  final String sexo;
  final String grado;
  final String nivel;
  final String fotoUrl; // URL de la foto del alumno
  final List<Curso> cursosInscritos;

  Alumno({
    required this.id,
    required this.nombre,
    required this.email,
    required this.dni,
    required this.sexo,
    required this.grado,
    required this.nivel,
    required this.fotoUrl,
    required this.cursosInscritos,
  });
}
