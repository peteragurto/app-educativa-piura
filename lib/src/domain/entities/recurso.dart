import 'package:yachaywai/src/domain/entities/curso.dart';
import 'package:yachaywai/src/domain/entities/docente.dart';

class RecursoEducativo {
  final String id;
  final String nombre;
  final String url; // URL del recurso en la nube
  final DateTime fechaSubida;
  final Docente subidoPor;
  final Curso curso;
  final TipoRecurso tipo;
  final String descripcion; // Descripción del recurso
  final String? etiquetas; // Etiquetas para facilitar la búsqueda

  RecursoEducativo({
    required this.id,
    required this.nombre,
    required this.url,
    required this.fechaSubida,
    required this.subidoPor,
    required this.curso,
    required this.tipo,
    required this.descripcion,
    this.etiquetas,
  });
}

enum TipoRecurso {
  documento,
  presentacion,
  hojadecalculo,
  audio,
  video,
  otro,
}
