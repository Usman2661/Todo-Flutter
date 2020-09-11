import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return    
    Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                
                ),
              shadowColor: Colors.white,
              elevation: 2.0,
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0,10.0,0.0,10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                
                   IconButton(
                    icon: Icon(Icons.check_circle_outline),
                    color: Colors.blue[400],
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                    Text(
                    'Clean the Clothes',
                  style: TextStyle(
                  color:Colors.grey[900],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
               
                ],),
              )
            ),
            );     
  }
}