import 'package:flutter/material.dart';
import 'ui/about.dart';
import 'ui/home.dart';

void main(){
  runApp(MaterialApp(
    title: "BMI",
    initialRoute: '/',
    routes: {
      Home.routeName:(context)=>Home(),
      About.routeName :(context)=>About(),
    },
  ));
}