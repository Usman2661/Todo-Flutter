import 'package:flutter/material.dart';
import 'package:todo/screens/createTodo.dart';
import 'package:todo/screens/home.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Text(
            'Task Manager',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
           onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(),
                  ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.list),
          title: Text('New Todo'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateTodo(),
                  ),
            );
          },
        ),
      ],
    ),
    );
  }
}