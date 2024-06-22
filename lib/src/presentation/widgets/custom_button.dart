
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color primaryColor;
  final EdgeInsets padding;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.primaryColor = const Color.fromARGB(255, 158, 91, 3), // Default color
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: padding,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
    );
  }
}
