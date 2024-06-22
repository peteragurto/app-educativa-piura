import 'package:flutter/material.dart';

class YachayWasiTitle extends StatelessWidget {// Parameter for the title text
  final double fontSize; // Parameter for font size adjustment

  const YachayWasiTitle({
    super.key,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Yachay',
            style: TextStyle(
              color: const Color.fromARGB(255, 158, 91, 3), // Light brown color for 'Yachay'
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'
            ),
          ),
          const TextSpan(text: ' '), // Spacer between words
          TextSpan(
            text: 'Wasi', // Space after 'Wasi'
            style: TextStyle(
              color: Colors.red, // Red color for 'Wasi'
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'
            ),
          ),
        ],
      ),
    );
  }
}
