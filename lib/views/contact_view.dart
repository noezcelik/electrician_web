import 'package:electrician_web/widgets/common_button.dart';
import 'package:electrician_web/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // URL açma işlemi için gerekli paket
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // FontAwesome paketini kullanıyoruz

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  // Telefon araması yapma fonksiyonu
  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Telefon araması yapılamıyor $phoneNumber';
    }
  }

  // E-posta gönderme fonksiyonu
  void _launchEmail(String emailAddress) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'E-posta açılamıyor $emailAddress';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header(),
        // title: const Text('Contactez-nous'),
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/2.jpg"), // Arka plan resmi
            fit: BoxFit.cover, // Resmi kaplama modunda ayarla
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width > 600
                  ? 450
                  : MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Firma Logosu
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        width: MediaQuery.of(context).size.width < 600
                            ? MediaQuery.of(context).size.width *
                                0.7 // Mobil ekranlar için genişliği %80'e ayarlıyoruz
                            : 400, // Masaüstü ekranlar için sabit genişlik
                        height: MediaQuery.of(context).size.width < 600
                            ? MediaQuery.of(context).size.width *
                                0.4 // Mobil ekranlar için yüksekliği %50'ye ayarlıyoruz
                            : 250, // Masaüstü ekranlar için sabit yükseklik
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Firma Adı
                  const Text(
                    'Electrician Services',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Firma Adresi ve İletişim Bilgileri
                  const Text(
                    '38200 Vienne  France',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  Container(
                      padding: const EdgeInsets.all(
                          8.0), // İçerik etrafına boşluk ekler
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.7), // Yarı şeffaf beyaz arka plan
                        borderRadius:
                            BorderRadius.circular(10), // Köşeleri yuvarlatma
                      ),
                      child: const Text(
                        'Contactez nous',
                        style: TextStyle(fontSize: 25),
                      )),
                  const SizedBox(height: 20),

                  // İletişim Bilgileri Kartları (Telefon, Email, Adres)
                  _buildContactInfo(
                    icon: Icons.phone,
                    label: 'Phone',
                    info: '+33632478213',
                    onTap: () =>
                        _launchPhone('+33632478213'), // Telefon araması
                  ),
                  _buildContactInfo(
                    icon: FontAwesomeIcons.whatsapp,
                    label: 'WhatsApp',
                    info:
                        '+33632478213', // WhatsApp telefon numarası (ülke kodu ile)
                    onTap: () => launchWhatsApp(
                        '+33632478213'), // WhatsApp mesajı gönderimi
                  ),

                  _buildContactInfo(
                    icon: Icons.email,
                    label: 'Email',
                    info: 'mk.contactelec@gmail.com',
                    onTap: () => _launchEmail(
                        'mk.contactelec@gmail.com'), // E-posta gönderimi
                  ),
                  _buildContactInfo(
                    icon: Icons.facebook, // FontAwesome Facebook ikonu
                    label: 'Facebook',
                    info: 'MK_elecc', // Facebook kullanıcı adı
                    onTap: () =>
                        _launchFacebook('MK_elecc'), // Facebook sayfasını aç
                  ),

                  _buildContactInfo(
                    icon: Icons.location_on,
                    label: 'Address',
                    info: '38200 Vienne France',
                    onTap: null, // Adres tıklanabilir olmayacak
                  ),

                  const SizedBox(height: 30),

                  // Sosyal Medya İkonları
                  Container(
                    width: 300, // Kartın genişliği
                    height: 70, // Kartın yüksekliği
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.7), // Şeffaf beyaz arka plan
                      borderRadius: BorderRadius.circular(10),
                    ), // Köşeleri yuvarlatılmış kart
                    padding:
                        const EdgeInsets.all(16.0), // Kartın kenar boşlukları
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // WhatsApp
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.whatsapp),
                          color: Colors.green,
                          iconSize: 30,
                          onPressed: () {
                            launchWhatsApp("+33632478213");
                          },
                        ),
                        const SizedBox(width: 20), // İkonlar arasında boşluk

                        // Facebook
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: Colors.blue,
                          iconSize: 30,
                          onPressed: () {
                            _launchFacebook('MK_elecc');
                          },
                        ),
                        const SizedBox(width: 20),

                        // Instagram
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.instagram),
                          color: Colors.pink,
                          iconSize: 30,
                          onPressed: () {
                            launchInstagram('mk_elecc');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // İletişim Bilgileri Kartı
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
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            info,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          onTap: onTap, // Telefon veya E-posta için tıklama etkinliği
        ),
      ),
    );
  }

  void launchWhatsApp(String phoneNumber) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Bu WhatsApp numarasına bağlanılamıyor';
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

  void launchInstagram(String username) async {
    final Uri url = Uri.parse("https://www.instagram.com/$username/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Instagram sayfasına bağlanılamıyor';
    }
  }
}
