import 'package:flutter/material.dart';
import 'package:my_fest/ui/widgets/simple_appbar.dart';

class FormPartyPage extends StatelessWidget {
  const FormPartyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: 'Nova Festa'),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome da Festa',
                  border: OutlineInputBorder(),
                ),
                focusNode: FocusNode(),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: LinearBorder()),
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        initialDate: DateTime.now());
                  },
                  child: Text("Selecione a data"))
            ],
          )),
    );
  }
}
