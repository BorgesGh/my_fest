import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fest/ui/pages/home_page.dart';
import 'package:my_fest/utils/style_guide.dart';

enum Routes {
  Home,
}

GoRouter goRouter() {
  return GoRouter(initialLocation: "/style_guide", routes: [
    GoRoute(
      path: "/",
      name: Routes.Home.name,
      pageBuilder: (context, state) {
        //if(Já entrou no sistema?)
        //return HomePage();
        //else
        //return IntrocutionPage();
        return const MaterialPage(
          child: HomePage(),
        );
      },
    ),
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
