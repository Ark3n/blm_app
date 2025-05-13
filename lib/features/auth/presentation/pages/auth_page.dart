/*

AUTH PAGE - determines whether to show login page or register page

*/

import 'package:build_launch_monetize_app/features/auth/presentation/pages/login_page.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(
            togglePages: togglePages,
          )
        : RegisterPage(
            togglePages: togglePages,
          );
  }
}
