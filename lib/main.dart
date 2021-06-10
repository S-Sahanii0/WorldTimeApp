import 'package:flutter/material.dart';
import 'package:time_app/pages/choose_location.dart';
import 'package:time_app/pages/homescreen.dart';
import 'package:time_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/':(context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/choose' : (context) => ChooseLocation(),
    },
  ));
}




