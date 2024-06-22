import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final double initialRadius;

  const RoundedImage({
    super.key,
    required this.imagePath,
    this.initialRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(initialRadius),
      child: Image.asset(
        imagePath,
        key: const Key("logo"),
        width: initialRadius * 2,
        height: initialRadius * 2,
        fit: BoxFit.cover,
      ),
    );
  }
}

