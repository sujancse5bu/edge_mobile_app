import 'package:edge_mobile_app/images.dart';
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
        useMaterial3: true,
      ),
      // home: const ImagesAndButton(),
      initialRoute: '/signup',
      routes: {
        '/login': (BuildContext context) => const LoginScreen(),
        '/signup': (BuildContext context) => const SignupScreen(),
        "/images": (BuildContext context) => const ImagesAndButton()
      },
    );
  }
}
