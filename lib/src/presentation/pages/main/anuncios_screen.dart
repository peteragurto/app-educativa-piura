import 'package:flutter/material.dart';

class AnnouceScren extends StatefulWidget {
  const AnnouceScren({super.key});

  @override
  State<AnnouceScren> createState() => _AnnouceScrenState();
}

class _AnnouceScrenState extends State<AnnouceScren> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text("Anuncios")
            ],
          ),
        ),
    );
  }
}