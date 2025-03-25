import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/router.dart';
import 'package:my_fest/ui/controller/product_list/product_list_bloc.dart';
import 'package:my_fest/ui/controller/product_list/product_list_event.dart';
import 'package:my_fest/ui/controller/product_list/product_list_state.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/ui/widgets/custom_dialog.dart';
import 'package:my_fest/ui/widgets/product_tile.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        backgroundColor: Pallete.primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.FormProduct.name);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _buildProductList(),
    );
  }

  _buildProductList() {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is ProductListLoaded) {
          return ListView.builder(
            itemCount: state.productList.length,
            itemBuilder: (context, index) {
              final product = state.productList[index];
              return ProductTile(
                nomeProduto: product.name,
                unidadeDeMedida: product.unitOfMeasurement,
                quantidadePorPessoa: product.amountPerPerson.toString(),
                onEdit: () =>
                    context.pushNamed(Routes.FormProduct.name, extra: product),
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomDialog(
                        title:
                            "Tem certeza que deseja excluir \"${product.name}\"?",
                        content: "Esse produto será apagado permanentemente",
                        textFirstButton: "Excluir",
                        onConfirmPressed: () {
                          context
                              .read<ProductListBloc>()
                              .add(ProductListDelete(product));
                          context.pop();
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        } else if (state is ProductListError) {
          return Center(
            child: Text(state.error.content),
          );
        } else {
          return const Center(child: Text('Erro desconhecido'));
        }
      },
    );
  }
}
