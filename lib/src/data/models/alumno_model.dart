import 'package:yachaywai/src/data/models/user_model.dart';

class AlumnoModel extends UserModel {
  final String grado;
  final String nivel;
  final List<String> cursosInscritosIds;

  AlumnoModel({
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

  factory AlumnoModel.fromFirebase(Map<String, dynamic> data, String id) =>
      AlumnoModel(
        id: id,
        nombre: data['nombre'] ?? '',
        email: data['email'] ?? '',
        dni: data['dni'] ?? '',
        sexo: data['sexo'] ?? '',
        rol: data['rol'] ?? '',
        fotoUrl: data['fotoUrl'],
        grado: data['grado'] ?? '',
        nivel: data['nivel'] ?? '',
        cursosInscritosIds: List<String>.from(data['cursosInscritosIds'] ?? []),
      );
}
