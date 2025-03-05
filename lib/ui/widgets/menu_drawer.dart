import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      width: MediaQuery.of(context).size.width * 0.70,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Pallete.primaryColor,
              image: DecorationImage(
                  image: AssetImage(
                'assets/fest.webp',
              )),
            ),
            curve: Curves.linear,
            child: Text(
              'Menu',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text(
              'Insumos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const ImageIcon(
              AssetImage('assets/garfo-faca.webp'),
              color: Pallete.primaryColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
