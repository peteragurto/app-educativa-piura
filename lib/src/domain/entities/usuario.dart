import 'package:flutter/foundation.dart';

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
}
