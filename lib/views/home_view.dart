import 'package:electrician_web/views/common_drawer.dart';
import 'package:electrician_web/views/footer_view.dart';
import 'package:flutter/material.dart';
import '../widgets/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const Header(),

      drawer:
          isMobile ? const CommonDrawer() : null, // Ortak Drawer'ı kullanıyoruz
      backgroundColor: Colors.blue[100],

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Professionnalisme dans les services électriques',
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 32 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nous offrons des services de qualité pour l\'installation électrique...',
                      style: TextStyle(fontSize: screenWidth > 600 ? 20 : 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildServiceCard(
                    context,
                    'Installation Électrique',
                    'Nous proposons une installation électrique complète pour vos maisons, bureaux et bâtiments commerciaux. Nos services comprennent la conception de réseaux électriques, l’installation de prises, interrupteurs, luminaires et tableaux électriques en respectant les normes de sécurité les plus strictes. Faites confiance à notre expertise pour une installation fiable et durable.',
                    'assets/images/edevat.jpg',
                    screenWidth,
                  ),
                  _buildServiceCard(
                    context,
                    'Maintenance et Réparation',
                    'Notre équipe est spécialisée dans la maintenance préventive et corrective des installations électriques. Que vous ayez besoin d’une vérification régulière ou d’une intervention rapide pour résoudre un problème, nous offrons des solutions rapides et efficaces pour minimiser les pannes électriques et garantir un fonctionnement optimal de vos systèmes.',
                    'assets/images/kalem.jpg',
                    screenWidth,
                  ),
                  _buildServiceCard(
                    context,
                    'Intervention d\'urgence',
                    'Nous offrons un service d’urgence disponible 24h/24 et 7j/7 pour tous vos problèmes électriques. Que ce soit une panne de courant, une surcharge électrique, ou un problème avec votre tableau électrique, nos électriciens qualifiés interviennent rapidement pour assurer votre sécurité et rétablir le bon fonctionnement de votre installation.',
                    'assets/images/electric.jpg',
                    screenWidth,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Footer(screenWidth: screenWidth)
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: ElevatedButton.icon(
            //     icon: const Icon(Icons.phone),
            //     label: const Text('Appelez maintenant'),
            //     onPressed: () {
            //       launchUrl(Uri.parse('tel:+33632478213'));
            //     },
            //   ),
            // ),
            // ElevatedButton.icon(
            //   icon: const Icon(FontAwesomeIcons.whatsapp),
            //   label: const Text('Contactez via WhatsApp'),
            //   onPressed: () {
            //     launchUrl(Uri.parse('https://wa.me/+33632478213'));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

Widget _buildServiceCard(BuildContext context, String title, String description,
    String imageUrl, double screenWidth) {
  // Ekran genişliğine göre kart genişliğini ayarla
  double cardWidth =
      screenWidth > 1024 ? screenWidth / 3 - 32 : double.infinity;

  return ConstrainedBox(
    constraints:
        const BoxConstraints(minHeight: 500), // Minimum yükseklik belirliyoruz
    child: Card(
      elevation: 4.0,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 300, // Görsel yüksekliğini sabitledik
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(description),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
