import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/crypto_list/view/crypto_list_page.dart';
import 'theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto money',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const CryptoListPage(),
    );
  }
}
