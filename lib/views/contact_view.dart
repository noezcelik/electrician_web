import 'package:electrician_web/views/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const CommonDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blauhimmel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width > 600
                  ? 450
                  : MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(52.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Firma Logosu
                  //_buildLogo(context),

                  _buildTitle(),

                  _buildAddress(),
                  const SizedBox(height: 10),
                  _buildContactBox(),
                  const SizedBox(height: 10),
                  _buildContactInfoSection(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget: Başlık
  Widget _buildTitle() {
    return const Text(
      'Electrician Services',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Widget: Adres
  Widget _buildAddress() {
    return const Text(
      '38200 Vienne  France',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Widget: İletişim Bilgileri Başlığı
  Widget _buildContactBox() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Contactez nous',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  // Widget: İletişim Bilgileri Kartları
  Widget _buildContactInfoSection() {
    return Column(
      children: [
        _buildContactInfo(
          icon: FontAwesomeIcons.mobileScreenButton,
          label: 'Mobile',
          info: '+33632478213',
          onTap: () => _launchPhone('+33632478213'),
        ),
        _buildContactInfo(
          icon: FontAwesomeIcons.whatsapp,
          label: 'WhatsApp',
          info: '+33632478213',
          onTap: () => launchWhatsApp('+33632478213'),
        ),
        _buildContactInfo(
          icon: FontAwesomeIcons.envelope,
          label: 'Email',
          info: 'mk.contactelec@gmail.com',
          onTap: () => _launchEmail('mk.contactelec@gmail.com'),
        ),
        _buildContactInfo(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          info: 'MK_elecc',
          onTap: () => _launchFacebook('MK_elecc'),
        ),
        _buildContactInfo(
          icon: FontAwesomeIcons.instagram,
          label: 'Instagram',
          info: 'MK_elecc',
          onTap: () => _launchInstagram('MK_elecc'),
        ),
      ],
    );
  }

  // Widget: İletişim Bilgileri Kartı
  Widget _buildContactInfo({
    required IconData icon,
    required String label,
    required String info,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.7),
        child: ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            info,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  // Yardımcı Fonksiyonlar: Telefon, WhatsApp, Email, Facebook
  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Telefon araması yapılamıyor $phoneNumber';
    }
  }

  void _launchEmail(String emailAddress) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: emailAddress);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'E-posta açılamıyor $emailAddress';
    }
  }

  void launchWhatsApp(String phoneNumber) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'WhatsApp numarasına bağlanılamıyor';
    }
  }

  void _launchFacebook(String username) async {
    final Uri facebookUri = Uri.parse('https://www.facebook.com/$username');
    if (await canLaunchUrl(facebookUri)) {
      await launchUrl(facebookUri);
    } else {
      throw 'Facebook sayfası açılamıyor: $username';
    }
  }

  void _launchInstagram(String username) async {
    final Uri url = Uri.parse("https://www.instagram.com/$username/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Instagram sayfasına bağlanılamıyor';
    }
  }
}
