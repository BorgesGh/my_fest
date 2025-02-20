import 'package:flutter/material.dart';
import 'package:my_fest/router.dart';
import 'package:my_fest/ui/style/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter(),
      debugShowCheckedModeBanner: false,
      title: 'My Fest',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Pallete.primaryColor),
      ),
    );
  }
}
