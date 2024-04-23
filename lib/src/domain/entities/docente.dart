import 'package:yachaywai/src/domain/entities/curso.dart';

class Docente {
  final String id;
  final String nombre;
  final String email;
  final String dni;
  final String sexo;
  final String fotoUrl; // URL de la foto del docente
  final List<Curso> cursosAsignados;

  Docente({
    required this.id,
    required this.nombre,
    required this.email,
    required this.dni,
    required this.sexo,
    required this.fotoUrl,
    required this.cursosAsignados,
  });
}
