import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  String content;
  Function()? onPressed;
  ActionButton({super.key, required this.content, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(10),
        backgroundColor: const WidgetStatePropertyAll(Pallete.orangeColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: onPressed,
      child: Text(
        content,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}
