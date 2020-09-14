import 'package:flutter/material.dart';
import 'package:todo/Widgets/CatagoryList.dart';
import 'package:todo/Widgets/Navigation.dart';
import 'package:todo/Widgets/TodoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        elevation: 20.0,
      ),
      appBar: AppBar(backgroundColor: Colors.white,
      title: Text(''),
      centerTitle: true,
      elevation: 0.0,
      iconTheme: new IconThemeData(color: Colors.grey[700]),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
      ],
      ),
      drawer: Navigation(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0,0.0,25.0,0.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Text( 'Whats up, Usman!',
          style: TextStyle(
            color:Colors.grey[800],
            fontSize: 28.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20.0),
           Text( 'CATAGORIES',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 16.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20.0),
            CatagoryList(),
            SizedBox(height:40.0),
            Text( 'My Tasks',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 16.0,
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height:20.0),
            Expanded(child: TodoList())
          ],
          )
            
          ),
      ),
    );
  }
}