import 'package:fitcycle/pages/ejercise_page.dart';
import 'package:fitcycle/pages/profile_page.dart';
import 'package:fitcycle/pages/progres_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions =<Widget>[
    EjercisePage(),
    ProgresPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex= index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio'),
      ),
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: "Ejercicio"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Lista Ejercicios"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Mi perfil"
          ),
        ],
        currentIndex:  _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
