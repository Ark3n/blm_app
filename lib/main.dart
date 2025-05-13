import 'package:build_launch_monetize_app/features/auth/presentation/pages/auth_page.dart';
import 'package:build_launch_monetize_app/firebase_options.dart';
import 'package:build_launch_monetize_app/themes/dark_mode.dart';
import 'package:build_launch_monetize_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //* firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //* run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
