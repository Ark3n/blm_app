import 'package:build_launch_monetize_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register user
  void register() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPw = confirmPasswordController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that field not empty
    if (name.isNotEmpty &
        email.isNotEmpty &
        password.isNotEmpty &
        confirmPw.isNotEmpty) {
      // check if passwords match
      if (password == confirmPw) {
        authCubit.register(name, email, password);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text('Password don\'t math')),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text('Please complete all fields!')),
        ),
      );
    }
  }

  // Dispose all controller to control memory lick
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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

              // signup button
              MyButton(
                text: 'SIGN UP',
                onTap: register,
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

                  // toggle to login page
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: Text(
                      'Login now.',
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
