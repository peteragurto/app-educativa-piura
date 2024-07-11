import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/domain/entities/recurso.dart';
import 'package:yachaywai/src/presentation/providers/recurso_provider.dart';

class SelectedCourseScreen extends StatefulWidget {
  final String cursoNombre;
  final String cursoId;
  final bool isStudent; // Añade un campo para verificar si es estudiante

  const SelectedCourseScreen({
    super.key,
    required this.cursoNombre,
    required this.isStudent,
    required this.cursoId,
  });

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen> {
  final ReceivePort _port = ReceivePort();
  Map<String, int> _downloadProgress = {};

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {
        // Aquí puedes actualizar el UI basado en el progreso de la descarga
        print('Descarga $id: $status - $progress%');
        _downloadProgress[id] = progress;
      });
    });

    FlutterDownloader.registerCallback(downloadCallback, step: 1);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, DownloadTaskStatus.values[status], progress]);
  }

  Future<void> _handleDownload(String recursoId) async {
    setState(() {
      _downloadProgress[recursoId] = 0;
    });

    final status = await Permission.storage.request();
    if (status.isGranted) {
      final recursoProvider =
          Provider.of<RecursoProvider>(context, listen: false);
      try {
        await recursoProvider.descargarRecurso(recursoId);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Descarga iniciada')),
        );
      } catch (e) {
        print('Error al descargar recurso: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al descargar recurso: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de almacenamiento requerido')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final recursoProvider =
        Provider.of<RecursoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cursoNombre),
        backgroundColor: const Color.fromARGB(255, 158, 91, 3),
      ),
      body: ListView.builder(
        itemCount: 10, // Suponiendo que hay 10 sesiones
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text('Sesión ${index + 1}'),
            children: [
              StreamBuilder<List<RecursoEducativo>>(
                stream: recursoProvider.obtenerRecursosPorSesion(
                    widget.cursoId, index + 1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    print('No hay recursos para esta sesión.');
                    return const Text('No hay recursos para esta sesión.');
                  }

                  final recursos = snapshot.data!;
                  print(
                      'Recursos recibidos para la sesión ${index + 1}: ${recursos.length}');
                  final widgets = <Widget>[];

                  widgets.addAll(recursos.map((recurso) {
                    return ListTile(
                      title: Text(recurso.nombre),
                      trailing: widget.isStudent
                          ? IconButton(
                              icon: _downloadProgress.containsKey(recurso.id)
                                  ? CircularProgressIndicator(
                                      value:
                                          _downloadProgress[recurso.id]! / 100)
                                  : Icon(Icons.download),
                              onPressed: () {
                                _handleDownload(recurso.id);
                              },
                            )
                          : PopupMenuButton<String>(
                              onSelected: (String value) {
                                if (value == 'download') {
                                  recursoProvider.descargarRecurso(recurso.id);
                                } else if (value == 'delete') {
                                  recursoProvider.eliminarRecurso(recurso.id);
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  const PopupMenuItem<String>(
                                    value: 'download',
                                    child: Text('Descargar'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'delete',
                                    child: Text('Eliminar'),
                                  ),
                                ];
                              },
                            ),
                    );
                  }).toList());

                  if (!widget.isStudent) {
                    widgets.add(
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text('Subir nuevo recurso'),
                        onTap: () {
                          // Lógica para subir un nuevo recurso
                        },
                      ),
                    );
                  }

                  return Column(children: widgets);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
