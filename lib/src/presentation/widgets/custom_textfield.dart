import 'package:flutter/material.dart';

class CustomYachayWasiTextField extends StatelessWidget {
  final String hintText; // Hint text for the field
  final IconData icon; // Icon to display in the field
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType; // Controller for text input

  const CustomYachayWasiTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.obscureText = false, // Default to non-obscure
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 243, 210),
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black38), // Icon with grey color
          const SizedBox(width: 10.0),
          Expanded( // Flexible space for text
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
                border: InputBorder.none,
              ),
              obscureText: obscureText,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
