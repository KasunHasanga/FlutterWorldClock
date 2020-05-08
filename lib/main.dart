import 'package:flutter/material.dart';
import 'package:worldtime/Pages/Home.dart';
import 'package:worldtime/Pages/Loading.dart';
import 'package:worldtime/Pages/choose_loacation.dart';



void main() {
  runApp(MaterialApp(

    initialRoute: '/',
    routes: {
      '/':(context) =>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChoseLoacation(),
    },
  ));
}
