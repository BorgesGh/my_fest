import 'package:flutter/material.dart';
import 'package:my_fest/ui/widgets/action_button.dart';

class StyleGuide extends StatefulWidget {
  const StyleGuide({super.key});

  @override
  State<StyleGuide> createState() => _StyleGuideState();
}

class _StyleGuideState extends State<StyleGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ActionButton(
        content: "Nova Festa +",
        onPressed: () {},
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
