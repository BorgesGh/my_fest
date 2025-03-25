import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/ui/controller/form_product/form_product_bloc.dart';
import 'package:my_fest/ui/controller/form_product/form_product_event.dart';
import 'package:my_fest/ui/controller/form_product/form_product_state.dart';
import 'package:my_fest/ui/controller/product_list/product_list_bloc.dart';
import 'package:my_fest/ui/controller/product_list/product_list_event.dart';
import 'package:my_fest/ui/style/pallete.dart';

class FormProductPage extends StatelessWidget {
  final Product? editProduct;
  const FormProductPage({super.key, this.editProduct});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormProductBloc(),
      child: BlocBuilder<FormProductBloc, FormProductState>(
        builder: (context, state) {
          if (editProduct != null && state is InitFormProductState) {
            context
                .read<FormProductBloc>()
                .add(InitialEditProduct(product: editProduct!));
          }

          switch (state) {
            case ErrorFormProductState _:
              return _errorState(context, state);
            case SuccessFormProductState _:
              return _sucessState(context, state);
          }

          final bloc = context.read<FormProductBloc>();
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Novo Produto',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Pallete.pinkColor,
                centerTitle: true,
                foregroundColor: Colors.white,
              ),
              body: Form(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            style: const TextStyle(fontSize: 20),
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
                            onChanged: (value) =>
                                bloc.add(QuantityChanged(value)),
                            keyboardType: TextInputType.number,
                          ),
                          // const Spacer(),
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
                                onPressed: state.isValid
                                    ? () {
                                        bloc.add(SubmitProduct(
                                            name: state.name,
                                            unit: state.unit,
                                            quantity: state.quantity,
                                            isValid: state.isValid));
                                      }
                                    : null,
                                label: const Text(
                                  "Salvar",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
              ));
        },
      ),
    );
  }
}

Widget _errorState(BuildContext context, ErrorFormProductState state) {
  return AlertDialog(
    title: const Text("Erro"),
    content: Text(state.result.error!),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("OK"),
      ),
    ],
  );
}

Widget _sucessState(BuildContext context, SuccessFormProductState state) {
  return Card(
    child: AlertDialog(
      elevation: 24,
      title: const Text("Sucesso"),
      content: const Text("Produto salvo com sucesso!"),
      actions: [
        TextButton(
          onPressed: () {
            context.read<ProductListBloc>().add(const ProductListLoad());
            context.pop();
          },
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
