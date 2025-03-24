import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/ui/pages/form_party_page.dart';
import 'package:my_fest/ui/pages/form_product_page.dart';
import 'package:my_fest/ui/pages/home_page.dart';
import 'package:my_fest/utils/style_guide.dart';

enum Routes {
  Home,
  FormParty,
  FormProduct,
}

GoRouter goRouter() {
  return GoRouter(initialLocation: "/form_product", routes: [
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
          return const FormProductPage();
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
