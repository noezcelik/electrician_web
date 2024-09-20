import 'package:flutter/material.dart';

// Ortak TextButton Widget'ı
class CommonTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor;
  final IconData? icon; // İkon eklemek için

  const CommonTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.blue,
    this.icon, // İsteğe bağlı olarak ikon ekleyebiliriz
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 18), // İkon boyutu ve rengi
            const SizedBox(width: 8), // İkon ve metin arasında boşluk
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth < 600
                  ? 16
                  : 18, // Ekran genişliğine göre yazı boyutu
            ),
          ),
        ],
      ),
    );
  }
}
