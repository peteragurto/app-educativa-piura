import 'package:yachaywai/src/domain/entities/usuario.dart';

abstract class AuthRepository {
  // Inicia sesión con correo electrónico y contraseña
  Future<Usuario> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // Cierra la sesión del usuario actual
  Future<void> signOut();

  // Recupera la información básica del usuario actualmente autenticado
  Future<Usuario?> getCurrentUser();

  // Verifica si el usuario está autenticado
  bool isAuthenticated();

  // Recupera la información completa del usuario autenticado (Alumno o Docente)
  Future<Usuario> getAuthenticatedUserInfo();

  Future<Usuario> getUserFromFirestore(String uid);
}
