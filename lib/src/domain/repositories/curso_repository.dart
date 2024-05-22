import 'package:yachaywai/src/domain/entities/curso.dart';

abstract class CursoRepository {
  Future<List<Curso>> getCursosAsignados(String usuarioId);
}
