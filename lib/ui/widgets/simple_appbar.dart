import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  SimpleAppbar({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Pallete.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
