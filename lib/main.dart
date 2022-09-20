import 'package:flutter/material.dart';
import 'package:tesis_proyect/class/frames/reposToShow.dart';
import 'package:tesis_proyect/class/frames/tesisInformation.dart';

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
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        'reposToShow': (BuildContext context) => ReposToShow(),
        'tesisInformation': (BuildContext context) => tesisInformation(),
      },
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

  List<Widget> listaOpciones = [ReposToShow(), Text('2'), Text('3')];

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
