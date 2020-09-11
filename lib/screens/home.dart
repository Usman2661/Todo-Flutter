import 'package:flutter/material.dart';
import 'package:todo/Widgets/TodoList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        elevation: 20.0,
      ),
      appBar: AppBar(backgroundColor: Colors.grey,
      title: Text(''),
      centerTitle: true,
      elevation: 0.0,
      ),
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
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: <Widget>[
              Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                            shadowColor: Colors.white,

              elevation: 10,
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
            //   onTap: () {
            //   print('Card tapped.');
            //  },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,70.0,10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    '10 Tasks',
                  style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                    Text(
                    'Business',
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
                      value: 0.2,
                    ), 
                      height: 10.0,
                      width: 100.0,
                  )
               
                ],),
              )
            ),
            ),

                 Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              shadowColor: Colors.white,
              elevation: 5,
              child: InkWell(
              splashColor: Colors.blue[400],
              onTap: () {
              print('Card tapped.');
             },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0,15.0,70.0,10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    '19 Tasks',
                  style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                    Text(
                    'Personal',
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
                      value: 0.8,
                    ), 
                      height: 10.0,
                      width: 100.0,
                  )
                ],),
              )
            ),
            ),
             Card(
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              shadowColor: Colors.white,
              elevation: 10,
              child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
            //   onTap: () {
            //   print('Card tapped.');
            //  },
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
                      value: 0.4,
                    ), 
                      height: 10.0,
                      width: 100.0,
                  )
                ],),
              )
            ),
            ),
            ],
              ),
            ),  
            SizedBox(height:20.0),
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