import 'package:flutter/material.dart';

class SelectedCourseScreen extends StatefulWidget {
  final String cursoNombre;

  const SelectedCourseScreen({
    super.key,
    required this.cursoNombre
  });

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cursoNombre),
        backgroundColor: const Color.fromARGB(255, 158, 91, 3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.red, width: 2),
            ),
            color: Colors.white, // Color amarillo
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: ListTile(
              title: Text(
                'Sesión ${index + 1}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_drop_down),
              onTap: () {
                // Acción al tocar la tarjeta (si es necesario)
              },
            ),
          );
        },
        ),
      )
    );
  }
}