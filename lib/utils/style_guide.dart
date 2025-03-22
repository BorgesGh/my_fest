import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/action_button.dart';
import 'package:my_fest/ui/widgets/beatifoul_dialog.dart';
import 'package:my_fest/ui/widgets/custom_dialog.dart';
import 'package:my_fest/ui/widgets/list_product.dart';
import 'package:my_fest/ui/widgets/menu_drawer.dart';
import 'package:my_fest/ui/widgets/party_tile.dart';
import 'package:my_fest/ui/widgets/product_tile.dart';

class StyleGuide extends StatefulWidget {
  const StyleGuide({super.key});

  @override
  State<StyleGuide> createState() => _StyleGuideState();
}

class _StyleGuideState extends State<StyleGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guia de Estilo"),
        backgroundColor: Pallete.primaryColor[200],
      ),
      drawer: const MenuDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ActionButton(
        content: "Nova Festa +",
        onPressed: () {},
      ),
      body: Container(margin: const EdgeInsets.all(10), child: GridProduct()),
    );
  }
}
