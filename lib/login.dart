import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Column(
        children: [
          getInputRow(label: 'Username', hint: 'Enter Username'),
          const SizedBox(
            height: 20,
          ),
          getInputRow(label: 'Password', hint: 'Enter Password'),
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Container(
                  height: 200,
                  width: 300,
                  // color: Colors.indigo,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 10,
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text('This is a container')),
              Container(
                height: 150,
                width: 150,
                color: Colors.red,
                child: Text('Top Left'),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Text('Right Bottom'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getInputRow({String? label, String? hint}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label.toString()),
        SizedBox(
          width: 10,
        ),
        Text(
          hint.toString(),
          style: TextStyle(color: Colors.black45),
        )
      ],
    );
  }
}
