import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'const/constant.dart';
import 'firebase_options.dart';
import 'provider/theme/theme_provider.dart';
import 'views/home/home_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allprovider,
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appname,
            themeMode: themeProvider.thememode,
            theme: ThemeProvider.light,
            darkTheme: ThemeProvider.dark,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
