/*
LOGIN PAGE UI
On this page user act login with
- email
- password

-------------------------------------------
Once the user successfully log in, they well be redirected to home page

if user doesn't have an account, the can go to register page to create one.

*/

import 'package:build_launch_monetize_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/components/my_button.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // auth cubit
  late final authCubit = context.read<AuthCubit>();

  // one forgot password box
  void openForgotPasswordBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Forgot password?')),
        content: MyTextfield(
            controller: emailController,
            hintText: 'email',
            isObscureText: false),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          // reset password
          TextButton(
            onPressed: () async {
              final message =
                  await authCubit.forgotPassword(emailController.text);
              if (message == 'Password reset email! Check you inbox') {
                Navigator.pop(context);
                emailController.clear();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

  // login button pressed
  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    // check email and password field not empty
    if (email.isNotEmpty & password.isNotEmpty) {
      authCubit.login(email, password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill both email and password'),
        ),
      );
    }
  }

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
                  GestureDetector(
                    onTap: openForgotPasswordBox,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),

              // login button
              MyButton(
                text: 'LOGIN',
                onTap: login,
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

                  // toggle to registration page
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: Text(
                      'Register now.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
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
