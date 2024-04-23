import 'package:yachaywai/src/domain/entities/alumno.dart';
import 'package:yachaywai/src/domain/entities/anuncio.dart';
import 'package:yachaywai/src/domain/entities/docente.dart';
import 'package:yachaywai/src/domain/entities/recurso.dart';

class Curso {
  final String id;
  final String nombre;
  final Docente docente;
  final String grado; // Grado del curso (por ejemplo, 5to)
  final String nivel; // Nivel educativo del curso (por ejemplo, Secundaria)
  final List<Alumno> alumnosInscritos;
  final List<RecursoEducativo> recursos;
  final List<Anuncio> anuncios;

  Curso({
    required this.id,
    required this.nombre,
    required this.docente,
    required this.grado,
    required this.nivel,
    required this.alumnosInscritos,
    required this.recursos,
    required this.anuncios,
  });
}
