import 'package:flutter/material.dart';
import 'views/home_view.dart'; // HomeView dosyasını çağırıyoruz
import 'package:electrician_web/views/contact_view.dart';

void main() {
  runApp(const ElektrikciWeb());
}

class ElektrikciWeb extends StatelessWidget {
  const ElektrikciWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services Électricien', // Başlık Fransızca yapıldı
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Başlangıç sayfası HomeView ("/")
      routes: {
        '/': (context) => const HomeView(), // Anasayfa
        '/contact': (context) => const ContactPage(), // İletişim sayfası
        // Diğer sayfalar buraya eklenebilir
      },
    ); // Ana sayfa olarak HomeView yüklenecek
  }
}
