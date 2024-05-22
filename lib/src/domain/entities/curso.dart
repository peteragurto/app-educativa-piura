import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/data/models/curso_model.dart';

@immutable
class Curso {
  final String id;
  final String nombre;
  final String docenteId;
  final String grado; // Grado del curso (por ejemplo, 5to)
  final String nivel; // Nivel educativo del curso (por ejemplo, Secundaria)
  final List<String> alumnosInscritosIds;
  final List<String> recursosIds;
  final List<String> anunciosIds;

  const Curso(
      {required this.id,
      required this.nombre,
      required this.docenteId,
      required this.grado,
      required this.nivel,
      required this.alumnosInscritosIds,
      required this.recursosIds,
      required this.anunciosIds});

  factory Curso.fromModel(CursoModel model) => Curso(
        id: model.id,
        nombre: model.nombre,
        docenteId: model.docenteId,
        grado: model.grado,
        nivel: model.nivel,
        alumnosInscritosIds: model.alumnosInscritosIds,
        recursosIds: model.recursosIds,
        anunciosIds: model.anunciosIds,
      );
}
