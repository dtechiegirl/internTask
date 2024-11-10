import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interntask/discover/discover_screen.dart';

import 'package:interntask/login/login.dart';
import 'package:interntask/login/bloc/login_bloc.dart';
import 'package:interntask/signup/bloc/signup_bloc.dart';
import 'package:interntask/signup/signup.dart';
import 'package:interntask/src/constants/custom_bottom_nav.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
         BlocProvider(create: (context) => LoginBloc(),
         
         ),
         BlocProvider(create: (context) => SignupBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          // home: AuthScreen(),
          routes: {
            '/': (context) =>  LoginScreen(),
            'signupscreen': (context) => const SignupScreen(),
            'discoverscreen': (context) => const DiscoverScreen(),
            'mainscreen': (context) => const DiscoverScreen(),
          },

          theme: ThemeData.light().copyWith(
              textTheme:
                  GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
        ));
  }
}
