import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/word_container.dart';

class ProductTile extends StatelessWidget {
  ProductTile(
      {super.key,
      required this.nomeProduto,
      required this.unidadeDeMedida,
      required this.quantidadePorPessoa});

  String nomeProduto;
  String unidadeDeMedida;
  String quantidadePorPessoa;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: (_) {},
            backgroundColor: Pallete.yellowColor[500]!,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
            borderRadius: BorderRadius.circular(10),
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Excluir',
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
      child: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                WordContainer(name: nomeProduto),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          nomeProduto,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Unidade de Medida"),
                                Text("Quantidade p/ pessoa"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  unidadeDeMedida,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  quantidadePorPessoa,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]))),
    );
  }
}
