import 'package:flutter/material.dart';

// Ortak TextButton Widget'ı
class CommonTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor;

  const CommonTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize:
              screenWidth < 600 ? 16 : 18, // Ekran genişliğine göre yazı boyutu
        ),
      ),
    );
  }
}
