import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/class/widgets/gradient.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            heroTag: 'uniqueTag',
            onPressed: () {Navigator.pop(context);},
            label: Row(
              children: [Icon(Icons.info), Text('Informacion')],
            )),
        appBar: AppBar(
          title: Text('Informacion acerca de la Aplicacion'),
        ),
        body: Stack(
          children: [
            Gradiente(),
            Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
              width: 850,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInImage(height: 350,width: 350,placeholder: AssetImage('assets/loading.gif'), image: NetworkImage('https://www.ecured.cu/images/b/b9/Logo_ult.jpeg',)),
                    RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:
                                'Esta aplicacion trata acerca de poder facilitar la consulta y descarga de tesis y articulos cientificos realizados en la ',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                            children: [
                              TextSpan(
                                  text: 'Universidad de Las Tunas',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              TextSpan(
                                  text:
                                      ' asi como calquier articulo cientifico desarrollado por nuestros investigadores. La aplicacion funciona utilizando',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25)),
                              TextSpan(
                                  text: ' GitHub ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      fontSize: 25),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      String url = 'https://www.github.com';
                                      var urllaunchable = await canLaunch(url);
                                      if (urllaunchable) {
                                        await launch(url);
                                      } else {
                                        AlertDialog(
                                          title: const Text('Error'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: const <Widget>[
                                                Text(
                                                    'Ha ocurrido un error y no se puede abrir la URL deseada. Por favor compruebe su conexion a internet',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25)),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Aceptar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                    }),
                              TextSpan(
                                  text:
                                      'pues este facilita la creacion de repositorios ilimitados de manera gratuita para poder almacenar las tesis y las investigaciones realizadas',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25)),
                            ])),
                    FadeInImage(height: 250,width: 250,placeholder: AssetImage('assets/loading.gif'), image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/GitHub_logo_2013.svg/245px-GitHub_logo_2013.svg.png')),
                    Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                              text:
                                  'GitHub es una forja (plataforma de desarrollo colaborativo) para alojar proyectos utilizando el sistema de control de versiones Git. Se utiliza principalmente para la creación de código fuente de programas de ordenador.'
                                  'El software que opera GitHub fue escrito en Ruby on Rails. Desde enero de 2010, GitHub opera bajo el nombre de GitHub, Inc.'
                                  'Anteriormente era conocida como Logical Awesome LLC. El código de los proyectos alojados en GitHub se almacena generalmente de forma pública. ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}
