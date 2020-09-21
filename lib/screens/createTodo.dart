import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:todo/Services/api/api_todo.dart';
import 'package:todo/Services/models/todo.dart';


class CreateTodo extends StatefulWidget {
  final String username;
  CreateTodo({Key key, @required this.username}) : super(key: key);
  
  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {


  final TodoApiService todoApi = TodoApiService();
  
  bool completed = false;
  bool isChecked = false;
  String title;
  final _taskController = TextEditingController();
  final _usernameController = TextEditingController();
  final _createTaskFormKey = GlobalKey<FormState>();
  String catagory = 'Personal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomPadding: false,
    backgroundColor: Colors.grey[50],
    body:
     Padding(
       padding: const EdgeInsets.fromLTRB(40.0,12.0,40.0,12.0),
       child: Container(
        child: Form
        (
          key:_createTaskFormKey,
          child:Column(
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

              TextFormField(
              autofocus: true,
              cursorColor: Colors.blue[900],
              cursorWidth: 5.0,
              controller: _taskController,
       
               validator: (value) {
              if (value.isEmpty) {
                return 'Please enter task';
              }
              return null;
            },
            onChanged: (value) {
            
            },
              style: 
              TextStyle(
              fontSize: 25.0,
              height: 2.0,
              color: Colors.grey[700],
              decoration: TextDecoration.none                
              ),
             decoration:  InputDecoration(
             errorStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
              ),
             hintText: 'Enter New Task',
              border: InputBorder.none,
              ),
              ),
              SizedBox(height:35.0),
              Row(children: <Widget>[
              RaisedButton(
              onPressed: () {
                Navigator.pop(context);
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
              onPressed: () async {
                  if (widget.username !=null ){

                  if (_createTaskFormKey.currentState.validate()) {
                    
                                _createTaskFormKey.currentState.save();
                                    
                                await todoApi.createTodo(
                                      Todo(
                                        title: _taskController.text,
                                        completed: completed,
                                        catagory: catagory,
                                        username: widget.username,
                                    ));

                                    Navigator.pop(context, true);
                          }
                  }
                  else {

                  showDialog(context: context, child:
                   AlertDialog(
                    title:  Center(child: Text("Additional Details")),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    content:
                    Container(
                    height: 140.0,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,  
                    children: <Widget>[
                    TextFormField(
                    autofocus: true,
                    cursorColor: Colors.blue[900],
                    cursorWidth: 5.0,
                    controller: _usernameController,
                    validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  onChanged: (value) {
                  
                  },
                    style: 
                    TextStyle(
                    fontSize: 20.0,
                    height: 2.0,
                    color: Colors.grey[700],
                    decoration: TextDecoration.none                
                    ),
                   decoration:  InputDecoration.collapsed(
                    hintText: 'Enter Your Name',
                    border: InputBorder.none,
                    ),
                    ),
                    SizedBox(height:20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    RaisedButton(
                        elevation: 2.0,
                        color: Colors.blue[900],
                        onPressed: () async {


                      if (_createTaskFormKey.currentState.validate()) {
                    
                                _createTaskFormKey.currentState.save();
                                    
                                await todoApi.createTodo(
                                      Todo(
                                        title: _taskController.text,
                                        completed: completed,
                                        catagory: catagory,
                                        username: _usernameController.text,
                                    ));

                                    Navigator.pop(context);
                          }

                        },
                        child:
                        Row(
                        children: <Widget>[
                        Text(
                          'Ok',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                            ),    
                            // SizedBox(width: 10.0),
                            // Icon(Icons.expand_less, color: Colors.white,),
                            ],
                            ),      
                            padding: EdgeInsets.fromLTRB(30.0,20.0,30.0,20.0),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        ),
                        ],
                        )
                        ],
                        ), 
                        )
                      )
                  );

                  }
                  
                                

               
                 

            
              },
              elevation: 2.0,
              color: Colors.blue[900],
              child:
              Row(
              children: <Widget>[
              Text(
                'New Task',
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
    )
        
    ),
     ),
    );
  }
}