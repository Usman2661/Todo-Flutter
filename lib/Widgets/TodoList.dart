import 'package:flutter/material.dart';
import 'package:todo/Widgets/ListCard.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return  
        ListView(
        children: <Widget>[
          TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),
           TodoCard(),
          SizedBox(height:5.0),  
        ],
      ); 
  }
}