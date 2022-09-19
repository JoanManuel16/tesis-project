import 'package:flutter/material.dart';
import 'package:tesis_proyect/class/models/tesisModel.dart';

Widget TesisOptionList(List<TesisModel> reposToShow, BuildContext context) {
  return ListView(
    children: reposToShow
        .map((r) => ListTile(
            title: Column(
              children: [Text(r.name), Text(r.htmlURL)],
            ),
            onTap: () => Navigator.pushNamed(context, 'tesisInformation')))
        .toList(),
  );
}
