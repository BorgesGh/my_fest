import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/model/product.dart';
import 'package:my_fest/ui/pages/form_party_page.dart';
import 'package:my_fest/ui/pages/form_product_page.dart';
import 'package:my_fest/ui/pages/home_page.dart';
import 'package:my_fest/ui/pages/product_list_page.dart';
import 'package:my_fest/utils/style_guide.dart';

enum Routes {
  Home,
  FormParty,
  FormProduct,
  ProductList,
}

GoRouter goRouter() {
  return GoRouter(initialLocation: "/", routes: [
    GoRoute(
      path: "/",
      name: Routes.Home.name,
      pageBuilder: (context, state) {
        //if(Já entrou no sistema?)
        //return HomePage();
        //else
        //return IntrocutionPage();
        return MaterialPage(
          child: HomePage(),
        );
      },
    ),
    GoRoute(
        name: Routes.FormParty.name,
        path: "/form_party",
        builder: (context, state) {
          return const FormPartyPage();
        }),
    GoRoute(
        name: Routes.FormProduct.name,
        path: "/form_product",
        builder: (context, state) {
          if (state.extra != null) {
            Product product = state.extra as Product;
            return FormProductPage(editProduct: product);
          }
          return const FormProductPage();
        }),
    GoRoute(
        name: Routes.ProductList.name,
        path: "/product_list",
        builder: (context, state) {
          return const ProductListPage();
        }),
    GoRoute(
      path: "/style_guide",
      name: "Style Guide",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: StyleGuide(),
        );
      },
    ),
  ]);
}
