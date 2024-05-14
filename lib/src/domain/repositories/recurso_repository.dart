import 'dart:io';

import 'package:yachaywai/src/domain/entities/recurso.dart';

abstract class RecursoEducativoRepository {
  Future<void> subirRecurso(File file, RecursoEducativo recurso);
  Future<void> eliminarRecurso(String recursoId);

  Stream<List<RecursoEducativo>> obtenerRecursosPorCurso(String cursoId);
  Stream<List<RecursoEducativo>> obtenerRecursosPorSesion(
    String cursoId,
    int numSesion,
  );

  Future<void> descargarRecurso(String recursoId);
}
