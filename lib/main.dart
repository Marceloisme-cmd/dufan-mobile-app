import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/theme/app_theme.dart';
import './features/auth/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT HIVE
  await Hive.initFlutter();

  // OPEN BOX TICKETS
  await Hive.openBox('tickets');

  // INIT DATE FORMAT INDONESIA
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // START APP DARI SPLASH
      home: const SplashPage(),

      theme: AppTheme.lightTheme,

      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),

          child: child!,
        );
      },
    );
  }
}
