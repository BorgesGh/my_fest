import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

// ignore: must_be_immutable
class FestButton extends StatelessWidget {
  Function()? onPressed;
  final double tileHeight = 50.0;
  FestButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileHeight,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Pallete.pinkColor),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("VISUALIZAR",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              ImageIcon(
                const AssetImage('assets/icone_festa.png'),
                color: Colors.white,
                size: tileHeight,
              ),
            ],
          )),
    );
  }
}
