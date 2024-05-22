class UserModel {
  final String id;
  final String nombre;
  final String email;
  final String dni;
  final String sexo;
  final String rol;
  final String? fotoUrl;

  UserModel({
    required this.id,
    required this.nombre,
    required this.email,
    required this.dni,
    required this.sexo,
    required this.rol,
    this.fotoUrl,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> data, String id) =>
      UserModel(
        id: id,
        nombre: data['nombre'] ?? '',
        email: data['email'] ?? '',
        dni: data['dni'] ?? '',
        sexo: data['sexo'] ?? '',
        rol: data['rol'] ?? '',
        fotoUrl: data['fotoUrl'],
      );
}
