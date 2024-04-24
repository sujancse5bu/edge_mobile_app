import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black12,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Username"),
              SizedBox(
                width: 10,
              ),
              Text(
                "Enter Username",
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Password"),
              SizedBox(
                width: 10,
              ),
              Text(
                "Enter Password",
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
        ],
      ),
    );
  }
}
