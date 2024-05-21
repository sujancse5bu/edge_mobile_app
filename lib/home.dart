import 'package:edge_mobile_app/common/navigation.dart';
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

  Future<String> getNameFromDatabase() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'BU CSE';
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
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                      name = '';
                    });
                    String _name = await getNameFromDatabase();
                    setState(() {
                      isLoading = false;
                      name = _name;
                    });
                    // print('name: $_name');
                  },
                  child: const Text('Get Name')),
              const SizedBox(
                height: 30,
              ),
              if (isLoading)
                const CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
