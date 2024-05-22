import 'package:yachaywai/src/core/exceptions/firebasedata_exceptions.dart';
import 'package:yachaywai/src/domain/entities/curso.dart';
import 'package:yachaywai/src/domain/repositories/curso_repository.dart';

class GetCursosAsignadosUseCase {
  final CursoRepository cursoRepository;

  GetCursosAsignadosUseCase(this.cursoRepository);

  Future<List<Curso>> call(String usuarioId) async {
    try {
      return await cursoRepository.getCursosAsignados(usuarioId);
    } catch (e) {
      throw GenericCursoException();
    }
  }
}
