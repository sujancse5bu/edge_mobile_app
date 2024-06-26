import 'dart:convert';
import 'dart:developer';
import 'package:edge_mobile_app/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomeScreen extends StatefulWidget {
  final String? username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String name = '';
  late Future<List<User>> futureUsers;
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    futureUsers = getUsersFromDB();
  }

  Future<String> getNameFromDatabase() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'BU CSE';
  }

  Future<List<User>> getUsersFromDB() async {
    try {
      Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      http.Response response = await http.get(uri);
      List<dynamic> decoded = json.decode(response.body);
      List<User> tempUsers = [];
      decoded.forEach(
        (element) {
          User tempUser = User.fromJson(element);
          tempUsers.add(tempUser);
        },
      );

      return tempUsers;
    } catch (e) {
      print('getting user error: ${e.toString()}');
      throw 'Something went wrong!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.orangeAccent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Access Token'),
                  icon: Icon(Icons.warning),
                  content: Container(
                    child: Text(localStorage.getItem('access-token') ?? ''),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.lock),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: futureUsers,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<User> tempUsers = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempUsers.length,
                          itemBuilder: (context, index) {
                            User user = tempUsers[index];
                            return Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orangeAccent, width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('User Id: ${user.id}'),
                                    Text('Name: ${user.username}'),
                                    Text('Email: ${user.email.toLowerCase()}'),
                                    Text(
                                        'Address: Street-${user.address.street} City-${user.address.city} Zip Code-${user.address.zipcode}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                    }
                    return Text(snapshot.data!.length.toString());
                  },
                ),
              ));
  }
}
