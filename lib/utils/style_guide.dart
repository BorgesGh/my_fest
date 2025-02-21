import 'package:flutter/material.dart';
import 'package:my_fest/ui/widgets/action_button.dart';
import 'package:my_fest/ui/widgets/menu_drawer.dart';
import 'package:my_fest/ui/widgets/party_tile.dart';

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
      ),
      drawer: MenuDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ActionButton(
        content: "Nova Festa +",
        onPressed: () {},
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PartyTile(
              title: "Festa de Aniversário",
              date: DateTime.now(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
