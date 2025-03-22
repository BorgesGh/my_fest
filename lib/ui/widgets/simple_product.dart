import 'package:flutter/material.dart';

class SimpleProduct extends StatelessWidget {
  SimpleProduct({super.key, required this.name});

  late String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name[0],
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Divider(),
          Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
