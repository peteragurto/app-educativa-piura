import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';

@immutable
class Alumno extends Usuario {
  final String grado;
  final String nivel;
  final List<String> cursosInscritosIds;

  const Alumno({
    required super.id,
    required super.nombre,
    required super.email,
    required super.dni,
    required super.sexo,
    required super.rol,
    super.fotoUrl,
    required this.grado,
    required this.nivel,
    required this.cursosInscritosIds,
  });
}
