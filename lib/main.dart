import 'package:flutter/material.dart';
import 'package:todo/screens/createTodo.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/loading.dart';

void main(){
     runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/create': (context) => CreateTodo(),

    },
  ));
}