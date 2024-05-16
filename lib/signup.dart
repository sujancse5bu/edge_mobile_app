import 'dart:math';

import 'package:edge_mobile_app/home.dart';
import 'package:edge_mobile_app/login.dart';
import 'package:edge_mobile_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Interest {
  final String title;
  final int credit;
  Interest({required this.credit, required this.title});
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late String userName = '';
  late String email;
  late String password;

  late String userNameError = '';

  final List<Interest> _interests = [
    Interest(credit: 3, title: "Programming"),
    Interest(credit: 1, title: "Robotics"),
    Interest(credit: 2, title: "Internet of Things"),
    Interest(credit: 5, title: "Networking"),
    Interest(credit: 2, title: "Hacking"),
    Interest(credit: 3, title: "Cyber Security"),
    Interest(credit: 1, title: "Machine Learning"),
  ];

  List<Interest> _selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.concertOne(
                  textStyle: TextStyle(fontSize: 35),
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  print('user name: $value');
                  setState(() {
                    userName = value;
                    if (value.contains('@')) {
                      userNameError = 'Dont use @';
                    } else {
                      userNameError = '';
                    }
                  });
                },
                decoration: InputDecoration(
                    label: Text('User Name'),
                    icon: Icon(Icons.person),
                    hintText: 'Enter User Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: userNameError.isEmpty ? null : userNameError)),
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
            // ------------

            SizedBox(
              height: 30,
            ),
            MultiSelectDialogField(
              buttonIcon: const Icon(Icons.cast_for_education),
              buttonText: const Text('Select Interests'),
              items:
                  _interests.map((e) => MultiSelectItem(e, e.title)).toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                _selectedInterests = values;
              },
              onSelectionChanged: (p0) {
                print('on selected change: ${p0.length}');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('${p0.length} interest(s) are selected.')));
              },
            ),
            // ------------------------------
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15))),
              onPressed: () {
                // username
                String username = 'BU CSE';

                // email
                String email = 'bu.cse@bu.ac.bd';

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MainScreen(username: username, email: email)));
              },
              child: Text('Sign Up'),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Already Have an account? '),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                },
                child: Text('Try Login'))
          ],
        ),
      ),
    );
  }
}
