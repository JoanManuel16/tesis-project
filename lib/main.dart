import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:tesis_proyect/class/repos.dart';
import 'package:http/http.dart' as http;

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

Future<All> fetchRepos() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/users/JoanManuel16/repos'));

  if (response.statusCode == 200) {
    print(response.body);
    return All.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<All> futureRepo = fetchRepos();
  @override
  void initState() {
    super.initState();
    futureRepo = fetchRepos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Titulo'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder<All>(
              future: futureRepo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Repo> reposToShow = List.empty(growable: true);
                  for (var i = 0; i < snapshot.data!.repos!.length; i++) {
                    reposToShow.add(Repo(
                        name: snapshot.data!.repos![i].name,
                        htmlURL: snapshot.data!.repos![i].htmlURL));
                  }
                  return ListView(
                    children: reposToShow
                        .map((r) => Card(
                              child: Column(
                                children: [Text(r.name), Text(r.htmlURL)],
                              ),
                            ))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error!!'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ));
  }
}
