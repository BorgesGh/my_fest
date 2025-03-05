import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/action_button.dart';
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
            ProductTile(
              nomeProduto: "Brigadeiro",
              unidadeDeMedida: "Unidade",
              quantidadePorPessoa: "3",
            ),
            ProductTile(
              nomeProduto: "Pastel",
              unidadeDeMedida: "Unidade",
              quantidadePorPessoa: "2",
            ),
            ProductTile(
              nomeProduto: "Refrigerante",
              unidadeDeMedida: "Litro",
              quantidadePorPessoa: "0.5",
            ),
            ProductTile(
              nomeProduto: "Pipoca",
              unidadeDeMedida: "Pacote",
              quantidadePorPessoa: "1",
            ),
            ProductTile(
              nomeProduto: "Sanduíche",
              unidadeDeMedida: "Unidade",
              quantidadePorPessoa: "2",
            ),
            ProductTile(
              nomeProduto: "Suco",
              unidadeDeMedida: "Litro",
              quantidadePorPessoa: "0.3",
            ),
          ],
        ),
      ),
    );
  }
}
