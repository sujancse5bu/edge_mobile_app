import 'package:edge_mobile_app/calculator.dart';
import 'package:edge_mobile_app/home.dart';
import 'package:edge_mobile_app/images.dart';
import 'package:edge_mobile_app/main_screen.dart';
import 'package:edge_mobile_app/search.dart';
import 'package:edge_mobile_app/settings.dart';
import 'package:edge_mobile_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:edge_mobile_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      // home: const ImagesAndButton(),
      initialRoute: '/calculator',
      routes: {
        '/login': (BuildContext context) => const LoginScreen(),
        '/signup': (BuildContext context) => const SignupScreen(),
        '/home': (BuildContext context) => const MainScreen(
              username: '',
              email: '',
            ),
        '/search': (BuildContext context) => const SearchScreen(),
        '/settings': (BuildContext context) => const Settings(),
        '/images': (BuildContext context) => const ImagesAndButton(),
        '/calculator': (BuildContext context) => const SimpleCalculator(),
      },
    );
  }
}
