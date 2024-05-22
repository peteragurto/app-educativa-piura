import 'package:yachaywai/src/data/models/user_model.dart';

class DocenteModel extends UserModel {
  final List<String> cursosAsignadosIds;

  DocenteModel({
    required super.id,
    required super.nombre,
    required super.email,
    required super.dni,
    required super.sexo,
    required super.rol,
    super.fotoUrl,
    required this.cursosAsignadosIds,
  });

  factory DocenteModel.fromFirebase(Map<String, dynamic> data, String id) {
    return DocenteModel(
      id: id,
      nombre: data['nombre'] ?? '',
      email: data['email'] ?? '',
      dni: data['dni'] ?? '',
      sexo: data['sexo'] ?? '',
      rol: data['rol'] ?? '',
      fotoUrl: data['fotoUrl'],
      cursosAsignadosIds: List<String>.from(data['cursosAsignadosIds'] ?? []),
    );
  }
}
