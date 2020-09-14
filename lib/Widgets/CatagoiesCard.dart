
import 'package:flutter/material.dart';

class CatagoryCard extends StatefulWidget {
  @override
  _CatagoryCardState createState() => _CatagoryCardState();
}

class _CatagoryCardState extends State<CatagoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              shadowColor: Colors.white,
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,70.0,10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    '8 Tasks',
                  style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                    Text(
                    'Home',
                  style: TextStyle(
                  color:Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                 SizedBox(
                      child: LinearProgressIndicator(
                      backgroundColor: Colors.blue,
                      value: 0.1,
                    ), 
                      height: 5.0,
                      width: 100.0,
                  )
                ],),
              )
            ),
            );
  }
}