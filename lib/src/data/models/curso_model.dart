class CursoModel {
  final String id;
  final String nombre;
  final String docenteId;
  final String grado;
  final String nivel;
  final List<String> alumnosInscritosIds;
  final List<String> recursosIds;
  final List<String> anunciosIds;

  CursoModel({
    required this.id,
    required this.nombre,
    required this.docenteId,
    required this.grado,
    required this.nivel,
    required this.alumnosInscritosIds,
    required this.recursosIds,
    required this.anunciosIds,
  });

  factory CursoModel.fromFirebase(
    Map<String, dynamic> data,
    String id,
  ) =>
      CursoModel(
        id: id,
        nombre: data['nombre'] ?? '',
        docenteId: data['docenteId'] ?? '',
        grado: data['grado'] ?? '',
        nivel: data['nivel'] ?? '',
        alumnosInscritosIds:
            List<String>.from(data['alumnosInscritosIds'] ?? []),
        recursosIds: List<String>.from(data['recursosIds'] ?? []),
        anunciosIds: List<String>.from(data['anunciosIds'] ?? []),
      );
}
