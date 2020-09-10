import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.grey[100],
      title: Text(''),
      centerTitle: true,
      elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
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
           Text( 'My Tasks',
            style: TextStyle(
            color:Colors.grey[500],
            fontSize: 18.0,
            fontWeight: FontWeight.bold
            ),
            ),
          ],
          )
          ),
      ),
    );
  }
}