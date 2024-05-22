import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yachaywai/src/core/exceptions/firebasedata_exceptions.dart';
import 'package:yachaywai/src/data/constants.dart';
import 'package:yachaywai/src/data/models/curso_model.dart';
import 'package:yachaywai/src/domain/entities/curso.dart';
import 'package:yachaywai/src/domain/repositories/curso_repository.dart';

class FirebaseCursoRepositoryImpl implements CursoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Curso>> getCursosAsignados(String usuarioId) async {
    try {
      final cursosSnapshot =
          await _firestore.collection(cursosCollection).get();
      final cursos = cursosSnapshot.docs.map((doc) {
        final data = doc.data();
        final cursoModel = CursoModel.fromFirebase(data, doc.id);

        return Curso.fromModel(cursoModel);
      }).toList();

      // Filtramos los cursos para obtener solo aquellos asignados al usuario
      final cursosAsignados = cursos.where((curso) {
        return curso.alumnosInscritosIds.contains(usuarioId) ||
            curso.docenteId == usuarioId;
      }).toList();

      return cursosAsignados;
    } catch (e) {
      throw GenericCursoException();
    }
  }
}
