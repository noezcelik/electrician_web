import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 130,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Services'),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.pushNamed(context, '/services');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('À propos de nous'),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              tileColor: Colors.blue[100],
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
    );
  }
}
