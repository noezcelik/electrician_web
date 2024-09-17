import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    final List<Map<String, String>> services = [
      {
        'title': 'Installation Électrique',
        'description':
            'Notre équipe propose des services professionnels d\'installation électrique pour les maisons, bureaux, et installations industrielles. Que vous construisiez une nouvelle maison ou rénoviez votre espace de travail, nous assurons une installation conforme aux normes de sécurité, en utilisant des technologies avancées et du matériel de haute qualité. Cela inclut la pose de systèmes d\'éclairage modernes, de panneaux électriques, de systèmes de chauffage électrique, ainsi que des dispositifs de sécurité comme des alarmes incendie. Nous travaillons en étroite collaboration avec nos clients pour adapter chaque projet à leurs besoins spécifiques.',
        'image': 'assets/images/ofisisik.jpeg',
      },
      {
        'title': 'Maintenance et Réparation',
        'description':
            'Pour garantir la longévité et la sécurité de vos systèmes électriques, nous proposons un service complet de maintenance préventive et de réparation. Cela inclut l\'inspection régulière des câbles, des disjoncteurs, et des systèmes d\'éclairage afin d\'identifier les problèmes potentiels avant qu\'ils ne deviennent graves. En cas de panne, nos techniciens qualifiés interviennent rapidement pour diagnostiquer les pannes et effectuer des réparations durables. Nos services couvrent également la mise à niveau des équipements anciens et le remplacement des installations non conformes aux normes actuelles.',
        'image': 'assets/images/pano3.jpeg',
      },
      {
        'title': 'Intervention d\'urgence',
        'description':
            'Nos services d\'intervention d\'urgence sont disponibles 24h/24, 7j/7, afin de vous assister rapidement en cas de panne électrique imprévue. Nos techniciens, formés pour intervenir dans des situations critiques, se déplacent rapidement pour rétablir l\'électricité en cas de coupure généralisée, de court-circuit ou de dégâts causés par des intempéries. Nous intervenons aussi pour des réparations d\'urgence liées à des risques de sécurité comme les incendies ou les inondations. Notre objectif est de minimiser les interruptions tout en garantissant un retour à la normale en toute sécurité.',
        'image': 'assets/images/kablolar.jpeg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent, // Scaffold'un arka planı şeffaf
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
                        Navigator.pushNamed(context, '/');
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
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 1200
                        ? 3
                        : MediaQuery.of(context).size.width > 800
                            ? 2
                            : 1, // Geniş ekranlarda 3 kart, daha dar ekranlarda 2 kart
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: MediaQuery.of(context).size.width > 1200
                        ? 1
                        : 0.8, // Kart genişlik-yükseklik oranı
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return _buildServiceCard(
                      context,
                      services[index]['title']!,
                      services[index]['description']!,
                      services[index]['image']!,
                    );
                  },
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // İçerik kadar kaydırılabilir
                ),
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
        width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl, // Yerel resim dosyası yolu
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 08.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
