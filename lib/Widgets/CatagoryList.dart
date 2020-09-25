import 'package:flutter/material.dart';
import 'package:todo/Services/models/catagoryCount.dart';

class CatagoryList extends StatefulWidget {
  @override
  _CatagoryListState createState() => _CatagoryListState();

  final List<CatagoryCount> catagoryCount;
  CatagoryList(this.catagoryCount);
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    print(widget.catagoryCount);
    print(widget.catagoryCount.length);
    return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  widget.catagoryCount == null ? 0 : widget.catagoryCount.length,
                itemBuilder: (BuildContext context, int index) {
      return    SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: <Widget>[
            Card(
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
                    '${widget.catagoryCount[index].count.toString()} Tasks',
                  style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                    Text(
                      widget.catagoryCount[index].catagory
                    ,
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
            )
             
            ],
              ),
            );
                });

    
  }
}