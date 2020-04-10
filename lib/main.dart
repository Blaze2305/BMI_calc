
import 'package:flutter/material.dart';
import 'ui/home.dart';

void main(){
  runApp(MaterialApp(
    title: "BMI",
    initialRoute: '/',
    routes: {
      '/':(context)=>Home(),
      '/alert':(context)=>SecondScreen()
    },
  ));
}