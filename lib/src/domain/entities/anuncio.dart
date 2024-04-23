import 'package:yachaywai/src/domain/entities/curso.dart';
import 'package:yachaywai/src/domain/entities/docente.dart';

class Anuncio {
  final String id;
  final String titulo;
  final String contenido;
  final DateTime fechaPublicacion;
  final Docente publicadoPor; // Docente que publicó el anuncio
  final Curso cursoRelacionado; // Curso al que está relacionado el anuncio

  Anuncio({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.fechaPublicacion,
    required this.publicadoPor,
    required this.cursoRelacionado,
  });
}
