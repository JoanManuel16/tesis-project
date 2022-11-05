import 'package:flutter/material.dart';
import 'package:flutter_application_14/class/models/tesisModel.dart';

import 'list_constructor.dart';

Widget TesisData(TesisModel tesis) {
  return SingleChildScrollView(
    child: Center(
      child: Container(
          width: 700,
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text('Intitucion'),
                      subtitle: Text(
                        tesis.institucion,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home_repair_service_rounded),
                      title: Text('Facultad'),
                      subtitle: Text(
                        tesis.facultad,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.apartment_sharp),
                      title: Text('Carrera'),
                      subtitle: Text(
                        tesis.carrera,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Autor(s)'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ListConstructor(tesis.autores)),
                  ),
                ]),
              ),
              Card(
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.person_add_alt_outlined),
                    title: Text('Tutor(s)'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ListConstructor(tesis.tutores)),
                  )
                ]),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.find_in_page_rounded),
                      title: Text('Nombre de la Investigacion'),
                      subtitle: Text(
                        tesis.name,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.precision_manufacturing_outlined),
                      title: Text('Resumen'),
                      subtitle: Text(
                        tesis.resumen,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))),);
}
