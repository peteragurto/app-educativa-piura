import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/domain/entities/curso.dart';
import 'package:yachaywai/src/domain/usecases/get_cursos_usecase.dart';

class CursosProvider extends ChangeNotifier {
  final GetCursosAsignadosUseCase _getCursosAsignadosUseCase;
  CursosProvider(this._getCursosAsignadosUseCase);

  List<Curso> _cursos = [];
  List<Curso> get cursos => _cursos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadCursos(String usuarioId) async {
    _isLoading = true;
    notifyListeners();

    _cursos = await _getCursosAsignadosUseCase(usuarioId);

    _isLoading = false;
    notifyListeners();
  }
}
