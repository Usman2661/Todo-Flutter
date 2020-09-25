import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:todo/Services/api/api_todo.dart';
import 'package:todo/Services/models/todo.dart';
import 'package:todo/screens/home.dart';

class TodoList extends StatefulWidget {

  final List<Todo> todos;
  Function() onUpdateTodoCallback;


  TodoList(this.todos, this.onUpdateTodoCallback);
  
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {


  final TodoApiService todoApi = TodoApiService();

  @override
  Widget build(BuildContext context) {
    return  
    ListView.builder(
                itemCount:  widget.todos == null ? 0 : widget.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ObjectKey(widget.todos[index]),
                    background: Container(
                      color: Colors.red, 
                      child:  Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 36.0,
                    ),
                      ),
                  confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Task"),
                        content:Text('Are you sure you wish to delete ${widget.todos[index].title}?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              await todoApi.deleteTodo(widget.todos[index].id);
                              await widget.onUpdateTodoCallback();

                               Navigator.of(context).pop(true);
                            },
                            child: const Text("DELETE")
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    },
                  );
                },
                  
                    child: Card(
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
                        value: widget.todos[index].completed,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        onChanged: (value) async {
                        
                          await todoApi.updateTodo(widget.todos[index].id,
                           Todo(
                             title:widget.todos[index].title ,
                             completed: value,
                             username:widget.todos[index].username,
                             catagory:widget.todos[index].catagory
                            ) 
                           );

                          await widget.onUpdateTodoCallback();

                        },
                          checkColor: Colors.white,
                          inactiveColor: Colors.pink[600],
                          activeColor: Colors.grey[500],
                
                      ),
                          SizedBox(width: 10.0),
                            Text(
                            widget.todos[index].title,
                          style: TextStyle(
                          color:Colors.grey[900],
                          fontSize: 18.0,
                          decoration: widget.todos[index].completed ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ],
                        ),
                      )
                    ),
                    ) ,
                    );
                             
                });
  }
}