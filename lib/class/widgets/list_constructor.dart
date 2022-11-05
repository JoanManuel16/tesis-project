import 'package:flutter/material.dart';

List<Widget> ListConstructor(List<String> lista) {
  return lista
      .map(
        (e) => Text(
          e,
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      )
      .toList();
}
