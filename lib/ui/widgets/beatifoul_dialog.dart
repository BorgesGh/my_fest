import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';

class BeatifoulDialog {
  static bottomDialog({required BuildContext context, required String title}) {
    Dialogs.bottomMaterialDialog(
      context: context,
      msg: "Olaaa",
      enableDrag: true,
      title: "Titulo",
      actionsBuilder: (context) {
        return [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Confirmar"),
          ),
        ];
      },
    );
  }
}
