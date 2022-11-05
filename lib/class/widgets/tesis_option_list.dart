import 'package:flutter/material.dart';
import 'package:flutter_application_14/class/models/tesisModel.dart';

Widget TesisOptionList(List<TesisModel> reposToShow, BuildContext context) {
  return Center(
      child: Container(
          width: 500,
          child: ListView(
            children: reposToShow
                .map((r) => ListTile(
                    leading: Icon(Icons.description_outlined),
                    title: Text(
                      (r.name),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.institucion,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        Text(
                          r.autores.first,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        )
                      ],
                    ),
                    onTap: () => Navigator.pushNamed(
                        context, 'tesisInformation',
                        arguments: r)))
                .toList(),
          )));
}
