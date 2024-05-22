import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yachaywai/src/domain/entities/recurso.dart';

class RecursoEducativoModel {
  final String id;
  final String nombre;
  final String url;
  final DateTime fechaSubida;
  final String docenteId;
  final String cursoId;
  final TipoRecurso tipo;
  final String? descripcion;
  final String? etiquetas;

  RecursoEducativoModel({
    required this.id,
    required this.nombre,
    required this.url,
    required this.fechaSubida,
    required this.docenteId,
    required this.cursoId,
    required this.tipo,
    this.descripcion,
    this.etiquetas,
  });

  factory RecursoEducativoModel.fromFirebase(
          Map<String, dynamic> data, String id) =>
      RecursoEducativoModel(
        id: id,
        nombre: data['nombre'] ?? '',
        url: data['url'] ?? '',
        fechaSubida: (data['fechaSubida'] as Timestamp).toDate(),
        docenteId: data['docenteId'] ?? '',
        cursoId: data['cursoId'] ?? '',
        tipo: TipoRecurso.values
            .firstWhere((e) => e.toString() == 'TipoRecurso.${data['tipo']}'),
        descripcion: data['descripcion'] ?? '',
        etiquetas: data['etiquetas'],
      );
}
