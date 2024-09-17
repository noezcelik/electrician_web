import 'package:electrician_web/widgets/common_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // Ekran genişliğini kontrol ediyoruz
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.02;
    bool isMobile = screenWidth < 800;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      //margin: EdgeInsets.symmetric(vertical: horizontalPadding),
      child: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.jpg",
              height: 70, // Resim yüksekliği
            ),
            const SizedBox(width: 25), // Resim ile başlık arasında boşluk

            Flexible(
              child: Text(
                'Electrician Services',
                style: TextStyle(
                    fontSize: screenWidth < 800 ? 16 : 18,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: isMobile
            ? IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )
            : null,
        actions: isMobile
            ? null
            : [
                CommonTextButton(
                  label: 'Accueil',
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                CommonTextButton(
                  label: 'Services',
                  onPressed: () {},
                ),
                CommonTextButton(
                  label: 'À propos de nous',
                  onPressed: () {},
                ),
                CommonTextButton(
                  label: 'Contact',
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
              ],
      ),
    );
  }

  // Drawer (Hamburger Menüsü) Ekleme ve Özelleştirme
  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color:
            Colors.white, // Tüm Drawer için arka plan rengini beyaz yapıyoruz
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Drawer başlığının arka plan rengi
              ),
              child: Text(
                'Menü',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text(
                'Accueil',
                style: TextStyle(
                    color: Colors.grey[800]), // Yazı rengini siyah yapıyoruz
              ),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
            ListTile(
              title: Text(
                'Services',
                style: TextStyle(
                    color: Colors.grey[800]), // Yazı rengini siyah yapıyoruz
              ),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
            ListTile(
              title: Text(
                'À propos de nous',
                style: TextStyle(
                    color: Colors.grey[800]), // Yazı rengini siyah yapıyoruz
              ),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
            ListTile(
              title: Text(
                'Contact',
                style: TextStyle(
                    color: Colors.grey[800]), // Yazı rengini siyah yapıyoruz
              ),
              onTap: () {
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
