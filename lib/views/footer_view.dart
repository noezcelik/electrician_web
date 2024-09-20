import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double screenWidth;

  const Footer({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    // Mobil ve web ekranları için sınır belirleyelim
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Container(
      width: double.infinity, // Tüm ekran genişliğini kapsar
      padding: isMobile
          ? const EdgeInsets.all(16) // Mobil için daha küçük padding
          : isTablet
              ? const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20) // Tablet için daha geniş padding
              : const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical:
                      30), // Web ve büyük ekranlar için daha geniş padding
      color: Colors.blueGrey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Électricien Qualifié - Votre Service de Confiance',
            style: TextStyle(
              fontSize: isMobile
                  ? 16
                  : isTablet
                      ? 18
                      : 20, // Ekran boyutuna göre font ayarı
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Entreprise Électricité SARL\n123 Rue de la Lumière, 75001 Paris, France\nSIRET: 123 456 789 00010',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile
                  ? 14
                  : isTablet
                      ? 16
                      : 18, // Ekran boyutuna göre ayarlama
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'TVA: FR12345678901 | Téléphone: +33 6 32 47 82 13\nEmail: contact@electricite-paris.fr',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile
                  ? 14
                  : isTablet
                      ? 16
                      : 18, // Ekran boyutuna göre ayarlama
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Hébergeur : OVH, 2 Rue Kellermann, 59100 Roubaix, France',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile
                  ? 12
                  : isTablet
                      ? 14
                      : 16, // Mobilde küçük, tablette orta, webde büyük
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Mentions légales sayfasına yönlendirme yapılabilir.
            },
            child: Text(
              'Mentions Légales | Politique de Confidentialité | Conditions Générales',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile
                    ? 12
                    : isTablet
                        ? 14
                        : 16,
                color: Colors.blue[300],
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '© 2024 Électricien Qualifié - Tous droits réservés',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile
                  ? 12
                  : isTablet
                      ? 14
                      : 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
