import 'package:fitcycle/pages/profile_page.dart';
import 'package:fitcycle/pages/progres_page.dart';
import 'package:flutter/material.dart';

import 'ejercise_page.dart';
class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Ejercicio"),
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.list), text: "Ejercicio"),
                    Tab(icon: Icon(Icons.api), text: "Progreso"),
                    Tab(icon: Icon(Icons.person), text: "Mi Pérfil"),
                  ],
                ),
              ),
              body: const TabBarView(children: [
                EjercisePage(),
                ProgresPage(),
                ProfilePage()
              ]),
            ))
    );
  }
}