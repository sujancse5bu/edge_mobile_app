import 'dart:convert';

import 'package:edge_mobile_app/models/LoginUser.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String userName = '';
  late String email = '';
  late String password = '';

  late String userNameError = '';

  Future<void> handleLoginPress() async {
    // await
    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Warning!!'),
            icon: Icon(Icons.warning),
            content: Container(
              child: Text('Invalid Email. Please enter a valid email.'),
            ),
          );
        },
      );
      return;
    }
    print('sending login request....');
    Uri uri = Uri.parse(
        'https://task-management-backend-vhcq.onrender.com/api/v1/login');

    var payload = {"email": email, "password": password};

    http.Response response = await http.post(uri, body: payload);
    print("login status code: ${response.statusCode}");
    print("login response body: ${response.body}"); //string
    dynamic decoded = json.decode(response.body); // map

    LoginUser loginUser = LoginUser.fromJson(decoded['data']);
    print(loginUser.email);
    print(loginUser.firstName);
    print(loginUser.lastName);

    print('token: ${decoded['token']}');
    localStorage.setItem('access-token', decoded['token']);
    Navigator.of(context).pushNamed('/home');
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 35),
            ),
            TextFormField(
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  print('Email: $value');
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    label: Text('Email'),
                    icon: Icon(Icons.email),
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: userNameError.isEmpty ? null : userNameError)),
            TextFormField(
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                  print('password: $value');
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                    label: Text('Password'),
                    icon: Icon(Icons.key),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: userNameError.isEmpty ? null : userNameError)),
            // ------------------------------
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                handleLoginPress();
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: Text('Warning!!'),
                //       icon: Icon(Icons.warning),
                //       content: Container(
                //         child: Text(
                //             'Invalid Credentials!! Please check your email or password.'),
                //       ),
                //     );
                //   },
                // );
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Don\'t have an account? '),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Try Signup'))
          ],
        ),
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
