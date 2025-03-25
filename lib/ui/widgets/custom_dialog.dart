import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

class CustomDialog extends StatelessWidget {
  Function() onConfirmPressed;
  String title;
  String content;
  String textFirstButton;
  CustomDialog(
      {super.key,
      required this.onConfirmPressed,
      required this.textFirstButton,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.primaryColor[300],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          onPressed: onConfirmPressed,
          child: Text(
            textFirstButton,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.grayTonalities[500],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
