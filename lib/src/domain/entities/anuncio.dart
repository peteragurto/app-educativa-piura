import 'package:flutter/foundation.dart';

@immutable
class Anuncio {
  final String id;
  final String titulo;
  final String contenido;
  final DateTime fechaPublicacion;
  final String publicadoByDocenteId; // Docente que publicó el anuncio
  final String cursoRelacionadoId; // Curso al que está relacionado el anuncio

  const Anuncio({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.fechaPublicacion,
    required this.publicadoByDocenteId,
    required this.cursoRelacionadoId,
  });
}
