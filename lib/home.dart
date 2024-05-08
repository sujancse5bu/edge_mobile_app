import 'package:edge_mobile_app/common/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          widget.username ?? '',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
