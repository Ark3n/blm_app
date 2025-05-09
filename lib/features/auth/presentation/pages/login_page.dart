/*
LOGIN PAGE UI
On this page user act login with
- email
- password

-------------------------------------------
Once the user successfully log in, they well be redirected to home page

if user doesn't have an account, the can go to register page to create one.

*/

import 'package:build_launch_monetize_app/features/auth/presentation/pages/components/my_button.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.lock_open,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: 20,
              ),

              // name of app
              Text(
                'B U L D   L A U N C H  M O N I T I Z E',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 25,
              ),

              // email textfield
              MyTextfield(
                controller: emailController,
                hintText: 'email',
                isObscureText: false,
              ),
              SizedBox(height: 10),

              // password textfield
              MyTextfield(
                  controller: passwordController,
                  hintText: 'password',
                  isObscureText: true),
              SizedBox(height: 10),

              // forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 25),

              // login button
              MyButton(
                text: 'LOGIN',
                onTap: () => {},
              ),
              SizedBox(height: 25),
              // oauth sign in later... (goggle apple)

              // don't have an account?, register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    'Register now.',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
