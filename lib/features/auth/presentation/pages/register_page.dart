import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/my_button.dart';
import 'components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                'Let\s create an account for you!',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 25,
              ),

              // name textfield
              MyTextfield(
                controller: nameController,
                hintText: 'name',
                isObscureText: false,
              ),
              SizedBox(height: 10),

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

              // password textfield
              MyTextfield(
                  controller: confirmPasswordController,
                  hintText: 'confirm password',
                  isObscureText: true),

              SizedBox(height: 25),

              // login button
              MyButton(
                text: 'SIGN UP',
                onTap: () => {},
              ),
              SizedBox(height: 25),
              // oauth sign in later... (goggle apple)

              // Already have an account?, Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    'Login now.',
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
