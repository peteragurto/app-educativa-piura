
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/domain/entities/recurso.dart';
import 'package:yachaywai/src/domain/repositories/recurso_repository.dart';

class RecursoProvider extends ChangeNotifier {
  final RecursoEducativoRepository recursoRepository;
  List<RecursoEducativo> _recursos = [];
  bool _isLoading = false;

  RecursoProvider(this.recursoRepository);

  List<RecursoEducativo> get recursos => _recursos;
  bool get isLoading => _isLoading;

  Future<void> loadRecursosPorCurso(String cursoNombre) async {
    _isLoading = true;
    notifyListeners();

    try {
      _recursos = (await recursoRepository.obtenerRecursosPorCurso(cursoNombre)) as List<RecursoEducativo>;
    } catch (e) {
      // Maneja el error aquí
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Stream<List<RecursoEducativo>> obtenerRecursosPorSesion(String cursoId, int numSesion) {
    print('Obteniendo recursos para cursoId: $cursoId, numSesion: $numSesion');
    return recursoRepository.obtenerRecursosPorSesion(cursoId, numSesion);
  }

  Future<void> descargarRecurso(String recursoId) async {
    await recursoRepository.descargarRecurso(recursoId);
  }

  Future<void> eliminarRecurso(String recursoId) async {
    await recursoRepository.eliminarRecurso(recursoId);
  }

  Future<void> subirRecurso(File file, RecursoEducativo recurso) async {
    await recursoRepository.subirRecurso(file, recurso);
  }
}