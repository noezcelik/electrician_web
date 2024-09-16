import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const Header(), // Header'ı AppBar olarak kullanıyoruz
      drawer: isMobile
          ? Drawer(
              // Mobilde hamburger menü
              child: Container(
                color: Colors.white, // Drawer'ın arka plan rengini beyaz yaptık
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white, // DrawerHeader arka planı
                      ),
                      child: Text(
                        'Menu',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Accueil',
                        style:
                            TextStyle(color: Colors.black), // Siyah yazı rengi
                      ),
                      onTap: () {
                        // "Accueil" sayfasına yönlendirme
                        Navigator.pop(context); // Drawer'ı kapat
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Services',
                        style:
                            TextStyle(color: Colors.black), // Siyah yazı rengi
                      ),
                      onTap: () {
                        // "Services" sayfasına yönlendirme
                        Navigator.pop(context); // Drawer'ı kapat
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'À propos de nous',
                        style:
                            TextStyle(color: Colors.black), // Siyah yazı rengi
                      ),
                      onTap: () {
                        // "À propos de nous" sayfasına yönlendirme
                        Navigator.pop(context); // Drawer'ı kapat
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Contact',
                        style:
                            TextStyle(color: Colors.black), // Siyah yazı rengi
                      ),
                      onTap: () {
                        // "Contact" sayfasına yönlendirme
                        Navigator.pushNamed(
                            context, '/contact'); // Drawer'ı kapat
                      },
                    ),
                  ],
                ),
              ),
            )
          : null, // Masaüstü cihazlarda Drawer'ı göstermiyoruz // Masaüstü cihazlarda Drawer'ı göstermiyoruz
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Professionnalisme dans les services électriques',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 32 : 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Nous offrons des services de qualité pour l\'installation électrique, la maintenance et les réparations. Contactez-nous pour vos besoins électriques.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
                ),
                textAlign: TextAlign.center,
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
                    'Des installations électriques de qualité pour vos maisons et bureaux.',
                    'assets/images/ofisisik.jpeg',
                  ),
                  _buildServiceCard(
                    context,
                    'Maintenance et Réparation',
                    'Solutions rapides à tous vos problèmes électriques.',
                    'assets/images/pano3.jpeg',
                  ),
                  _buildServiceCard(
                    context,
                    'Intervention d\'urgence',
                    'Services électriques d\'urgence 24h/24 et 7j/7.',
                    'assets/images/kablolar.jpeg',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.phone),
                label: const Text('Appelez maintenant'),
                onPressed: () {
                  launchUrl(Uri.parse('tel:+33632478213'));
                },
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(FontAwesomeIcons.whatsapp),
              label: const Text('Contactez via WhatsApp'),
              onPressed: () {
                launchUrl(Uri.parse('https://wa.me/+33632478213'));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Hizmet Kartı Oluşturma Fonksiyonu
  Widget _buildServiceCard(
      BuildContext context, String title, String description, String imageUrl) {
    return Card(
      elevation: 4.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 600 ? 600 : double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl, // Yerel resim dosyası yolu
              fit: BoxFit.cover,
              height: 300,
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
    );
  }
}
