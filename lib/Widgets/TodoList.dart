import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:todo/Services/models/todo.dart';
import 'package:todo/Widgets/ListCard.dart';

class TodoList extends StatelessWidget {

  final List<Todo> todos;
  TodoList({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  

      ListView.builder(
                itemCount: todos == null ? 0 : todos.length,
                itemBuilder: (BuildContext context, int index) {
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
                        padding: const EdgeInsets.fromLTRB(15.0,8.0,0.0,8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[ 
                        CircularCheckBox(
                        value: todos[index].completed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        onChanged: (value) {
                          todos[index].completed = value;
                        },
                          checkColor: Colors.white,
                          inactiveColor: Colors.pink[600],
                          activeColor: Colors.grey[500],
                  
                      ),
                          SizedBox(width: 10.0),
                            Text(
                            todos[index].title,
                          style: TextStyle(
                          color:Colors.grey[900],
                          fontSize: 18.0,
                          decoration: todos[index].completed ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ],),
                      )
                    ),
                    );     
                });
      //   ListView(
      //   children: <Widget>[
      //     TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),
      //      TodoCard(),
      //     SizedBox(height:5.0),  
      //   ],
      // ); 
  }
}