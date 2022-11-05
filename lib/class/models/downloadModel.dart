// ignore_for_file: invalid_required_named_param, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Download_Model {
String  repo_From='';
String  archive_Name='';
Download_Model({@required String repo_From='',@required String archive_name=''}){
  archive_Name=archive_name;
  repo_From=repo_From;
}
factory Download_Model.fromJson(Map<String, dynamic> json) {
    return Download_Model(repo_From: json['sad'] ,archive_name: json['sad']);
}

  }
  Future downloadZIP(String repoFrom,String archiveName) async {
    final response = await http.get(Uri.parse(
      //https://api.github.com/repos/JoanManuel16/FichaEstudiante/contents/Guia%20del%20programa.docx
        'https://api.github.com/repos/Tesis-ULT/$repoFrom/contents/$archiveName.pdf'));

    if (response.statusCode == 200) {
      return Download_Model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    } 
  }
  class ReposToDownload extends StatefulWidget {
  String ? name;
  String ? repo;  
  ReposToDownload({Key? key, name , repo}) : super(key: key);

  @override
  _ReposToDownloadState createState() => _ReposToDownloadState();
}

class _ReposToDownloadState extends State<ReposToDownload> {
  Future futureDownload = downloadZIP("", "");
  @override
  void initState() {
    super.initState();
    futureDownload = downloadZIP("", "");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [

      ],
    ));
  }
}