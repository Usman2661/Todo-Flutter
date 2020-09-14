import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

    int _radioValue = 0;
    bool isChecked = false;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      // switch (_radioValue) {
      //   case 0:
      //     break;
      //   case 1:
      //     break;
      //   case 2:
      //     break;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return    
    Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
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
                
                CircularCheckBox(
                value: isChecked,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (value) {
                            setState(() {
                      isChecked = value;
                    });
                },
                  checkColor: Colors.white,
                  inactiveColor: Colors.purple,
                  activeColor: Colors.grey[500],
              ),
                  SizedBox(width: 10.0),
                    Text(
                    'Clean the Clothes',
                  style: TextStyle(
                  color:Colors.grey[900],
                  fontSize: 18.0,
                    ),
                  ),
                ],),
              )
            ),
            );     
  }
}