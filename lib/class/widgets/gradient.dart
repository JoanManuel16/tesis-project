import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget Gradiente() {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.5),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromARGB(170, 150, 240, 255),
            Color.fromARGB(110, 200, 200, 250)
          ])));
}
