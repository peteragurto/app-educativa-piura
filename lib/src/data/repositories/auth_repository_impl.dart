import 'package:yachaywai/src/core/exceptions/auth_exceptions.dart';
import 'package:yachaywai/src/data/constants.dart';
import 'package:yachaywai/src/data/models/alumno_model.dart';
import 'package:yachaywai/src/data/models/docente_model.dart';
import 'package:yachaywai/src/data/models/user_model.dart';
import 'package:yachaywai/src/domain/entities/alumno.dart';
import 'package:yachaywai/src/domain/entities/docente.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';
import 'package:yachaywai/src/domain/repositories/auth_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Usuario> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user == null) {
        throw UserNotFoundAuthException();
      }
      return await _getUserFromFirestore(user.uid);
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  @override
  Future<Usuario> getAuthenticatedUserInfo() async {
    final user = await getCurrentUser();
    if (user == null) {
      throw UserNotAuthenticatedException();
    } else {
      final userDoc =
          await _firestore.collection(usersCollection).doc(user.id).get();
      final userData = userDoc.data();

      if (userData == null) {
        throw UserNotFoundAuthException();
      }

      final userRole = userData['rol'] ?? '';
      if (userRole == 'alumno') {
        return Alumno.fromModel(AlumnoModel.fromFirebase(userData, user.id));
      } else if (userRole == 'docente') {
        return Docente.fromModel(DocenteModel.fromFirebase(userData, user.id));
      }
      return user;
    }
  }

  @override
  Future<Usuario?> getCurrentUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw UserNotFoundAuthException();
    } else {
      return await _getUserFromFirestore(currentUser.uid);
    }
  }

  @override
  bool isAuthenticated() {
    return _auth.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<Usuario> _getUserFromFirestore(String uid) async {
    final userDoc = await _firestore.collection(usersCollection).doc(uid).get();
    final userData = userDoc.data();
    if (userData == null) {
      throw UserNotFoundAuthException();
    }
    final userModel = UserModel.fromFirebase(userData, uid);
    return Usuario.fromModel(userModel);
  }
}
