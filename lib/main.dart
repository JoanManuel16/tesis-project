import 'package:flutter/material.dart';
import 'package:flutter_application_14/class/frames/reposToShow.dart';
import 'package:flutter_application_14/class/frames/tesisInformation.dart';
import 'class/frames/informationPage.dart';

// contrasena del gmail
//VzejEmk9Y9CzWEW
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repositorio de Tesis',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        'reposToShow': (BuildContext context) => ReposToShow(),
        'tesisInformation': (BuildContext context) => tesisInformation(),
        'information': (BuildContext context) => InformationPage()
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositorio de Tesis'),
      ),
      body: ReposToShow(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag',
        onPressed: () {
          Navigator.pushNamed(context, 'information');
        },
        child: Icon(
          Icons.info,
        ),
        hoverColor: Colors.red,
      ),
    );
  }
}
