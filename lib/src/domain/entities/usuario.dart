import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/data/models/user_model.dart';

@immutable
class Usuario {
  final String id;
  final String nombre;
  final String email;
  final String dni;
  final String sexo;
  final String rol;
  final String? fotoUrl;

  const Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.dni,
    required this.sexo,
    required this.rol,
    this.fotoUrl,
  });

  factory Usuario.fromModel(UserModel model) => Usuario(
        id: model.id,
        nombre: model.nombre,
        email: model.email,
        dni: model.dni,
        sexo: model.sexo,
        rol: model.rol,
        fotoUrl: model.fotoUrl,
      );
}
