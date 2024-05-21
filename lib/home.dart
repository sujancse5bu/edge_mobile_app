import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String name = '';
  List<dynamic> users = [];

  Future<String> getNameFromDatabase() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'BU CSE';
  }

  Future<void> getUsersFromDB() async {
    try {
      Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      http.Response response = await http.get(uri);
      // print('response body: ${response.body}');
      List<dynamic> decoded = json.decode(response.body);
      inspect(decoded);
      setState(() {
        users = decoded;
        isLoading = false;
      });
    } catch (e) {
      print('getting user error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await getUsersFromDB();
                  // setState(() {
                  //   name = '';
                  // });
                  // String _name = await getNameFromDatabase();
                  // setState(() {
                  //   name = _name;
                  // });
                  // print('name: $_name');
                },
                child: const Text('Get Name')),
            const SizedBox(
              height: 30,
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Text(users[index]['name']);
              },
            )
          ],
        ),
      ),
    );
  }
}
// SingleChildScrollView(
//         physics: const ScrollPhysics(),
//         child: Column(
//           children: [
//             // ElevatedButton(
//             //     onPressed: () async {
//             //       setState(() {
//             //         isLoading = true;
//             //       });
//             //       await getUsersFromDB();
//             //       // setState(() {
//             //       //   name = '';
//             //       // });
//             //       // String _name = await getNameFromDatabase();
//             //       // setState(() {
//             //       //   name = _name;
//             //       // });
//             //       // print('name: $_name');
//             //     },
//             //     child: const Text('Get Name')),
//             // const SizedBox(
//             //   height: 30,
//             // ),
//             // if (isLoading)
//             //   const CircularProgressIndicator(
//             //     strokeWidth: 5,
//             //   ),
            
//           ],
//         ),
//       )