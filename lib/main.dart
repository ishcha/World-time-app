import 'package:flutter/material.dart';
import 'package:world_time/pages/Home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => loading(),  //where in widget tree
    '/home': (context) => Home(),
    '/location': (context) => chooseLocation(),
  },
));

