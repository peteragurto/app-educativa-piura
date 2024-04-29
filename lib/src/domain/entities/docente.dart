import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/data/models/docente_model.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';

@immutable
class Docente extends Usuario {
  final List<String> cursosAsignadosIds;

  const Docente({
    required super.id,
    required super.nombre,
    required super.email,
    required super.dni,
    required super.sexo,
    required super.rol,
    super.fotoUrl,
    required this.cursosAsignadosIds,
  });

  factory Docente.fromModel(DocenteModel model) => Docente(
        id: model.id,
        nombre: model.nombre,
        email: model.email,
        dni: model.dni,
        sexo: model.sexo,
        rol: model.rol,
        fotoUrl: model.fotoUrl,
        cursosAsignadosIds: model.cursosAsignadosIds,
      );
}
