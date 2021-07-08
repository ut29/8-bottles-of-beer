import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget BorderBox(Widget contents) {
  return Container(
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(
      width: 2,
      color: Colors.black26,
    )),
    child: contents,
  );
}

// ignore: non_constant_identifier_names
Widget BorderSection(String title, Widget contents) {
  return BorderBox(Column(
    children: [
      Text(title),
      const Divider(
        height: 3,
        thickness: 2,
        color: Colors.black26,
      ),
      contents,
    ],
  ));
}
