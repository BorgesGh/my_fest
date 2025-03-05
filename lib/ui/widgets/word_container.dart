import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

class WordContainer extends StatelessWidget {
  String name;
  WordContainer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Pallete.grayTonalities[100],
      ),
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          name[0],
          style: const TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
