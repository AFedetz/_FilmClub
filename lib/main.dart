import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
  },

));