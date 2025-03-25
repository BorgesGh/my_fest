import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fest/data/persistence/local/database_helper.dart';
import 'package:my_fest/router.dart';
import 'package:my_fest/ui/controller/product_list/product_list_bloc.dart';
import 'package:my_fest/ui/controller/product_list/product_list_event.dart';
import 'package:my_fest/ui/style/pallete.dart';
import 'package:my_fest/utils/assets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('/assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  Assets.loadAssets();

  DatabaseHelper().database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (_) => ProductListBloc()..add(const ProductListLoad()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter(),
        debugShowCheckedModeBanner: false,
        title: 'My Fest',
        theme: ThemeData(
          fontFamily: GoogleFonts.dosis().fontFamily,
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Pallete.primaryColor),
        ),
      ),
    );
  }
}
