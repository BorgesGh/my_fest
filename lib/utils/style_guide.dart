import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/action_button.dart';
import 'package:my_fest/ui/widgets/beatifoul_dialog.dart';
import 'package:my_fest/ui/widgets/custom_dialog.dart';
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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductTile(
              nomeProduto: "Coxinha",
              unidadeDeMedida: "Unidade",
              quantidadePorPessoa: "5",
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => CustomDialog(
                            title: "Deseja exluir?",
                            content: "O Conteúdo será excluído permanentemente",
                            onConfirmPressed: () {},
                            textFirstButton: "Confirmar",
                          ));
                },
                child: Text("Abrir Dialog")),
            TextButton(
                onPressed: () {
                  BeatifoulDialog.bottomDialog(
                      context: context, title: "Titulo");
                },
                child: Text("Abrir Dialog")),
          ],
        ),
      ),
    );
  }
}
