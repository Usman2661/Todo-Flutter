import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class CreateTodo extends StatefulWidget {
  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomPadding: false,
    backgroundColor: Colors.grey[50],
    body:
     Padding(
       padding: const EdgeInsets.fromLTRB(40.0,12.0,40.0,12.0),
       child: Container(
        child: 
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0,50.0,0.0,0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
          RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 2.0,
              fillColor: Colors.grey[50],
              child: Icon(
                Icons.close,
                size: 35.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(
                side: BorderSide(color: Colors.grey[500])
              ),
            )
          ]),
        ),
        Center(
          child:    
          Column(
            children:<Widget>[

               SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[

               TextField(
              autofocus: true,
              cursorColor: Colors.blue[900],
              cursorWidth: 5.0,
              style: 
              TextStyle(
              fontSize: 25.0,
              height: 2.0,
              color: Colors.grey[700],
              decoration: TextDecoration.none                
              ),
             decoration:  InputDecoration.collapsed(
              hintText: 'Enter New Task',
              border: InputBorder.none,
              ),
              ),
              SizedBox(height:35.0),
              Row(children: <Widget>[
              RaisedButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              elevation: 2.0,
              color: Colors.grey[50],
              child:
              Row(
              children: <Widget>[
              Icon(Icons.calendar_today, color: Colors.grey[700],),
              SizedBox(width:20.0),
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18.0,
                ),
              ),       
                ],
              ),      
              padding: EdgeInsets.fromLTRB(20.0,20.0,30.0,20.0),
              shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[400]),
              borderRadius: BorderRadius.circular(30.0),
          
              ),
              ),
              SizedBox(width:2.0),
              RaisedButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              elevation: 2.0,
              color: Colors.grey[50],
              child:
              Row(
              children: <Widget>[
                CircularCheckBox(
                value: isChecked,
                // materialTapTargetSize: MaterialTapTargetSize.,
                onChanged: (value) {
                            setState(() {
                      isChecked = value;
                    });
                },
                  checkColor: Colors.blue[900],
                  inactiveColor: Colors.blue[900],
                  activeColor: Colors.blue[900],
              ),
     
              ],
              ),      
              padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
              shape: CircleBorder(
                side: BorderSide(color: Colors.grey[400])
              ),
              ),
              ],
              ),
              SizedBox(height:80.00),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0,0.0,0.0,0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                 IconButton(
                icon: Icon(Icons.folder_special),
                color: Colors.grey[600],
                iconSize: 35.0,
                onPressed: () {},
                ),
                IconButton(
                icon: Icon(Icons.outlined_flag),
                color: Colors.grey[600],
                iconSize: 35.0,
                onPressed: () {},
              ),
              IconButton(
              icon: Icon(Icons.brightness_2),
              color: Colors.grey[600],
              iconSize: 35.0,
              onPressed: () {},
              ),
                ],
                ),
              )


            ],
            )
            ),   
            ]
          )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 2.0,
              color: Colors.blue[900],
              child:
              Row(
        children: <Widget>[
              Text(
                'Create Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),    
              SizedBox(width: 10.0),
              Icon(Icons.expand_less, color: Colors.white,),
              ],
          ),      
              padding: EdgeInsets.fromLTRB(30.0,20.0,30.0,20.0),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
          ),
          ),
          ],
          ),
        )
    ],
    ), 
    ),
     ),
    );
  }
}