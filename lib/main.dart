import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fest/router.dart';
import 'package:my_fest/ui/style/pallete.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('/assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

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
        fontFamily: GoogleFonts.dosis().fontFamily,
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Pallete.primaryColor),
      ),
    );
  }
}
