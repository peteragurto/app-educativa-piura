import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yachaywai/src/data/models/recurso_educativo_model.dart';
import 'package:yachaywai/src/domain/entities/recurso.dart';
import 'package:yachaywai/src/domain/repositories/recurso_repository.dart';

class FirebaseRecursoEducativoImpl implements RecursoEducativoRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseRecursoEducativoImpl(this._firestore, this._storage);

  @override
  Stream<List<RecursoEducativo>> obtenerRecursosPorCurso(String cursoId) {
    try {
      final snapshots = _firestore.collection('recursos')
        .where('cursoId', isEqualTo: cursoId)
        .snapshots();

      return snapshots.map((snapshot) {
        return snapshot.docs.map((doc) {
          return RecursoEducativo.fromModel(RecursoEducativoModel.fromFirebase(doc.data(), doc.id));
        }).toList();
      });
    } catch (e) {
      throw Exception('Error al obtener recursos por curso: $e');
    }
  }

  @override
  Stream<List<RecursoEducativo>> obtenerRecursosPorSesion(String cursoId, int numSesion) {
    try {
      final snapshots = _firestore.collection('recursos')
        .where('cursoId', isEqualTo: cursoId)
        .where('numSesion', isEqualTo: numSesion.toString())
        .snapshots();

      return snapshots.map((snapshot) {
        return snapshot.docs.map((doc) {
          return RecursoEducativo.fromModel(RecursoEducativoModel.fromFirebase(doc.data(), doc.id));
        }).toList();
      });
    } catch (e) {
      throw Exception('Error al obtener recursos por sesión: $e');
    }
  }

  @override
  Future<void> subirRecurso(File file, RecursoEducativo recurso) async {
    try {
      // Generar un nuevo ID para el recurso
      final recursoId = _firestore.collection('recursos').doc().id;

      // Subir el archivo al Firebase Storage
      final storageRef = _storage.ref().child('recursos/$recursoId');
      final uploadTask = storageRef.putFile(file);
      await uploadTask.whenComplete(() => null);

      // Obtener la URL del archivo subido
      final downloadUrl = await storageRef.getDownloadURL();

      // Almacenar los metadatos en Cloud Firestore
      await _firestore.collection('recursos').doc(recursoId).set({
        'nombre': recurso.nombre,
        'url': downloadUrl,
        'fechaSubida': recurso.fechaSubida,
        'docenteId': recurso.docenteId,
        'cursoId': recurso.cursoId,
        'tipo': recurso.tipo.toString().split('.').last,
        'descripcion': recurso.descripcion,
        'etiquetas': recurso.etiquetas,
      });
    } catch (e) {
      // Manejo de errores
      throw Exception('Error al subir el recurso: $e');
    }
  }

  @override
  Future<void> descargarRecurso(String recursoId) async {
    try {
      // Obtener la referencia del documento en Firestore
      final docSnapshot = await _firestore.collection('recursos').doc(recursoId).get();
      if (!docSnapshot.exists) {
        throw Exception('Recurso no encontrado en Firestore');
      }
      
      // Obtener la URL y el nombre del archivo desde el documento
      final data = docSnapshot.data()!;
      final url = data['url'] as String?;
      final nombre = data['nombre'] as String?;

      if (url == null) {
        throw Exception('URL no encontrada en el documento del recurso');
      }

      final downloadUrl = url.startsWith('gs://')
        ? await _convertGsUrlToDownloadUrl(url)
        : url;

      if (nombre == null) {
        throw Exception('Nombre del archivo no encontrado en el documento del recurso');
      }

      // Obtener la ruta de la carpeta de documentos
      final documentsDirectory = await getApplicationDocumentsDirectory();
      final downloadPath = documentsDirectory.path;

      // Enviar la tarea de descarga a FlutterDownloader
      await FlutterDownloader.enqueue(
        url: downloadUrl,
        savedDir: downloadPath,
        fileName: nombre,
        showNotification: true, // muestra una notificación cuando la descarga se completa
        openFileFromNotification: true, // abre el archivo descargado cuando el usuario toca la notificación
        saveInPublicStorage: true,
        headers: {}
      );
    } catch (e) {
      // Manejo de errores
      print('Error al descargar el recurso: $e');
      throw Exception('Error al descargar el recurso: $e');
    }
  }

// Función para convertir una URL gs:// a una URL de descarga https://
Future<String> _convertGsUrlToDownloadUrl(String gsUrl) async {
  try {
    // Firebase Storage no permite convertir directamente gs:// a https:// en el SDK del cliente,
    // por lo que se asume que gsUrl se usa tal cual.
    // Sin embargo, si se necesita convertir, se debe usar el SDK de Firebase Admin o la API de Firebase Storage para obtener la URL.
    // Aquí se usa la URL directamente para simplificación.
    final storageRef = FirebaseStorage.instance.refFromURL(gsUrl);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print('Error al convertir gs:// a URL de descarga: $e');
    throw Exception('Error al convertir gs:// a URL de descarga: $e');
  }
}


  @override
  Future<void> eliminarRecurso(String recursoId) async {
    try {
      // Eliminar el archivo de Firebase Storage
      final storageRef = _storage.ref().child('recursos/$recursoId');
      await storageRef.delete();

      // Eliminar los metadatos de Cloud Firestore
      await _firestore.collection('recursos').doc(recursoId).delete();
    } catch (e) {
      // Manejo de errores
      throw Exception('Error al eliminar el recurso: $e');
    }
  }
}
