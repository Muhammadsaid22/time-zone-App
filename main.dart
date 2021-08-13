import 'package:flutter/material.dart';
import 'package:world_time/pages/location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      }
  ));
}
