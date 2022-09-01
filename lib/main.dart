import 'package:flutter/material.dart';
import 'package:tesis_proyect/class/Repositorios.dart';
import 'dart:convert';
import 'package:tesis_proyect/class/repos.dart';
import 'package:http/http.dart' as http;

// contrasena del gmail
//VzejEmk9Y9CzWEW
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> listaOpciones = [reposToShow(), Text('2'), Text('3')];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body: listaOpciones[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Midle'),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Rigth',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
