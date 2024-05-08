import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      backgroundColor: Colors.blueAccent,
      selectedFontSize: 20,
      selectedItemColor: Colors.white,
      onTap: (value) {
        print('selected value: $value');
        if (value == 0) {
          // navigate to home
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (value == 1) {
          // navigate to search
          Navigator.of(context).pushReplacementNamed('/search');
        } else if (value == 2) {
          // navigate to settings
          Navigator.of(context).pushReplacementNamed('/settings');
        }

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
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
