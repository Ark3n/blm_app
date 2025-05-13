import 'package:build_launch_monetize_app/features/auth/data/firebase_auth_repo.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/cubits/auth_state.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/auth_page.dart';
import 'package:build_launch_monetize_app/features/auth/presentation/pages/components/loading_page.dart';
import 'package:build_launch_monetize_app/firebase_options.dart';
import 'package:build_launch_monetize_app/themes/dark_mode.dart';
import 'package:build_launch_monetize_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/pages/home_page.dart';

void main() async {
  //* firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //* run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // auth repo
  final firebaseAuthRepo = FirebaseAuthRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(firebaseAuthRepo)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        theme: lightMode,
        darkTheme: darkMode,
        debugShowCheckedModeBanner: false,
        /*

        BLOC CONSUMER - Auth 

        */

        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            if (kDebugMode) {
              print(state);
            }

            // unauthenticated -> auth page (login or register)
            if (state is Unauthenticated) {
              return AuthPage();
            }

            // authenticated -> home page
            if (state is Authenticated) {
              return HomePage();
            }

            // loading ...
            else {
              return LoadingPage();
            }
          },

          // listen for state changes
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
