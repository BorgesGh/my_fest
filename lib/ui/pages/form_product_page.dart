import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_fest/ui/controller/blocs/form_product_bloc.dart';
import 'package:my_fest/ui/controller/events/form_product_event.dart';
import 'package:my_fest/ui/controller/states/form_product_state.dart';

class FormProductPage extends StatelessWidget {
  const FormProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormProductBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FormProductBloc, FormProductState>(
            builder: (context, state) {
              final bloc = context.read<FormProductBloc>();
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Produto',
                        border: const OutlineInputBorder(),
                        errorText: state.nameError,
                      ),
                      onChanged: (value) => bloc.add(NameChanged(value)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Unidade de medida',
                        border: const OutlineInputBorder(),
                        errorText: state.unitError,
                      ),
                      onChanged: (value) => bloc.add(UnitChanged(value)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quantidade por pessoa',
                        border: const OutlineInputBorder(),
                        errorText: state.quantityError,
                      ),
                      onChanged: (value) => bloc.add(QuantityChanged(value)),
                      keyboardType: TextInputType.number,
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      onPressed: state.isValid
                          ? () {
                              bloc.add(SubmitProduct());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Produto salvo com sucesso!'),
                                ),
                              );
                            }
                          : null,
                      label: const Text(
                        "Salvar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
