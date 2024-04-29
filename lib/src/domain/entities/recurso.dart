import 'package:flutter/foundation.dart';

@immutable
class RecursoEducativo {
  final String id;
  final String nombre;
  final String url; // URL del recurso en la nube(Firebase Storage)
  final DateTime fechaSubida;
  final String docenteId; //Id de documento de Docente
  final String cursoId; //Id de documento de Curso
  final TipoRecurso tipo;
  final String descripcion; // Descripción del recurso
  final String? etiquetas;

  const RecursoEducativo(
      {required this.id,
      required this.nombre,
      required this.url,
      required this.fechaSubida,
      required this.docenteId,
      required this.cursoId,
      required this.tipo,
      required this.descripcion,
      this.etiquetas}); // Etiquetas para facilitar la búsqueda
}

enum TipoRecurso {
  documento,
  presentacion,
  hojadecalculo,
  audio,
  video,
  otro,
}
