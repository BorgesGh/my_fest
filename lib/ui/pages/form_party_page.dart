import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/simple_appbar.dart';

class FormPartyPage extends StatelessWidget {
  const FormPartyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: 'Nova Festa'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome da Festa',
                    border: OutlineInputBorder(),
                  ),
                  focusNode: FocusNode(),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Numero de Participantes',
                          border: OutlineInputBorder(),
                        ),
                        focusNode: FocusNode(),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const LinearBorder(),
                            backgroundColor: Pallete.primaryColor,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              initialDate: DateTime.now());
                        },
                        child: const Text(
                          "Selecione a data",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text(
                        "Salvar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                        shape: const LinearBorder(),
                        maximumSize: Size.infinite,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
