import 'package:flutter/material.dart';
import 'package:my_fest/ui/widgets/simple_product.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.85,
            ),
            children: List.generate(
                10,
                (index) => SimpleProduct(
                      name: "Salame",
                    ))));
  }
}
