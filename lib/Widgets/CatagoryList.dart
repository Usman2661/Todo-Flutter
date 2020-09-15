import 'package:flutter/material.dart';
import 'package:todo/Widgets/CatagoiesCard.dart';

class CatagoryList extends StatefulWidget {
  @override
  _CatagoryListState createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    return       
    SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: <Widget>[

           CatagoryCard(),
           SizedBox(
             width:10,
           ),
          CatagoryCard(),
             SizedBox(
             width:10,
           ),
          CatagoryCard(),
             SizedBox(
             width:10,
           ),
          CatagoryCard(),

             
            ],
              ),
            );
  }
}