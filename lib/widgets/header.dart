import 'package:electrician_web/widgets/common_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // Ekran genişliğini kontrol ediyoruz
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.0;
    bool isMobile = screenWidth < 800;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      //margin: EdgeInsets.symmetric(vertical: horizontalPadding),

      child: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.jpg",
              height: 75, // Resim yüksekliği
            ),
            const SizedBox(width: 15), // Resim ile başlık arasında boşluk

            Flexible(
              child: Text(
                'MK ELEC Electrician Services',
                style: TextStyle(
                    fontSize: screenWidth < 800 ? 16 : 20,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: isMobile
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context)
                          .openDrawer(); // Drawer'ı açmak için Builder kullanılıyor
                    },
                  );
                },
              )
            : null,
        actions: isMobile
            ? null
            : [
                CommonTextButton(
                  label: 'Accueil',
                  icon: Icons.home, // İkon ekledik
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  textColor: Colors.black, // Yazı ve ikon rengi
                ),
                CommonTextButton(
                  label: 'Services',
                  icon: Icons.build,
                  onPressed: () {},
                  textColor: Colors.black,
                ),
                CommonTextButton(
                  label: 'À propos de nous',
                  icon: Icons.person,
                  onPressed: () {},
                  textColor: Colors.black,
                ),
                CommonTextButton(
                  label: 'Contact',
                  icon: Icons.contact_mail,
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  textColor: Colors.black,
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
              leading: const Icon(
                Icons.home_filled,
                size: 35,
              ),
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
                Navigator.pushNamed(context, '/contact'); // Drawer'ı kapat
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
