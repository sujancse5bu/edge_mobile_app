import 'package:edge_mobile_app/common/navigation.dart';
import 'package:edge_mobile_app/home.dart';
import 'package:edge_mobile_app/search.dart';
import 'package:edge_mobile_app/settings.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  var screens = [const HomeScreen(), const SearchScreen(), const Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueAccent,
        selectedFontSize: 20,
        selectedItemColor: Colors.white,
        onTap: (value) {
          print('selected value: $value');

          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
