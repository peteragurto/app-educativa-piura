import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/data/models/recurso_educativo_model.dart';

@immutable
class RecursoEducativo {
  final String id;
  final String nombre;
  final String url; // URL del recurso en la nube(Firebase Storage)
  final DateTime fechaSubida;
  final String docenteId; //Id de documento de Docente
  final String cursoId;
  final String numSesion; //Id de documento de Curso
  final TipoRecurso tipo;
  final String? descripcion; // Descripción del recurso
  final String? etiquetas;

  const RecursoEducativo(
      {required this.id,
      required this.nombre,
      required this.url,
      required this.fechaSubida,
      required this.docenteId,
      required this.cursoId,
      required this.tipo,
      this.descripcion,
      this.etiquetas,
      required this.numSesion});

  factory RecursoEducativo.fromModel(RecursoEducativoModel model) =>
      RecursoEducativo(
        id: model.id,
        nombre: model.nombre,
        url: model.url,
        fechaSubida: model.fechaSubida,
        docenteId: model.docenteId,
        cursoId: model.cursoId,
        tipo: model.tipo,
        descripcion: model.descripcion,
        etiquetas: model.etiquetas, 
        numSesion: '',
      );
}

enum TipoRecurso {
  documento,
  presentacion,
  hojadecalculo,
  audio,
  video,
  otro,
}
