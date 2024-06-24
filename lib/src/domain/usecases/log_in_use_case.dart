import 'package:yachaywai/src/core/exceptions/auth_exceptions.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';
import 'package:yachaywai/src/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Usuario?> call({
    required String email,
    required String password,
  }) async {
    try {
      // Primero, autenticamos al usuario con sus credenciales
      await authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Luego, obtenemos la información completa del usuario autenticado
      return await authRepository.getAuthenticatedUserInfo();
    } catch (e) {
      throw UserNotAuthenticatedException();
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<Usuario> getUserFromFirestore(String uid) {
    return authRepository.getUserFromFirestore(uid);
  }
}
