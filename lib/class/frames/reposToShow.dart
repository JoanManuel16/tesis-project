import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesis_proyect/class/models/tesisModel.dart';
import 'package:http/http.dart' as http;
import 'package:tesis_proyect/class/providers/db_provider.dart';
import 'package:tesis_proyect/class/widgets/tesis_option_list.dart';

Future<All> fetchRepos() async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/Tesis-ULT/repos'));

  if (response.statusCode == 200) {
    print(response.body);
    return All.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class ReposToShow extends StatefulWidget {
  ReposToShow({Key? key}) : super(key: key);

  @override
  _ReposToShowState createState() => _ReposToShowState();
}

class _ReposToShowState extends State<ReposToShow> {
  Future<All> futureRepo = fetchRepos();
  @override
  void initState() {
    super.initState();
    futureRepo = fetchRepos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: FutureBuilder<All>(
            future: futureRepo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TesisModel> reposToShow = List.empty(growable: true);
                for (var i = 0; i < snapshot.data!.repos!.length; i++) {
                  reposToShow.add(TesisModel(
                      name: snapshot.data!.repos![i].name,
                      htmlURL: snapshot.data!.repos![i].htmlURL,
                      description: snapshot.data!.repos![i].description));
                  DBProvider.db
                      .insertTesis(reposToShow[reposToShow.length - 1]);
                }

                return TesisOptionList(reposToShow, context);
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
      ),
    );
  }
}
