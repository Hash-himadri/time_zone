import 'package:flutter/material.dart';
import 'package:time_zone/Pages/Loading.dart';
import 'package:time_zone/Pages/choose_location.dart';
import 'Pages/home.dart';

//Trying github
void main() {
  runApp(MaterialApp(
    home: ChooseLocation(),
    // initialRoute: "/",
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/location" : (context) => ChooseLocation(),
    },
  ));
}
